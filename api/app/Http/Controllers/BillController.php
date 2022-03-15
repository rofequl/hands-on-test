<?php

namespace App\Http\Controllers;

use App\Events\SendMail;
use App\Models\Bill;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class BillController extends Controller
{
    public function index()
    {
        return DB::table('bills')->join('customers', 'customers.id', '=', 'bills.customer_id')
            ->select('customers.name as customerName', 'customers.email as customerEmail', 'bills.*')->get();
    }

    public function customerBill()
    {
        return DB::table('bills')->join('customers', 'customers.id', '=', 'bills.customer_id')
            ->select('customers.name as customerName', 'customers.email as customerEmail', 'bills.*')->where('bills.customer_id', auth()->user()->id)->get();
    }

    public function store(Request $request)
    {
        $request->validate([
            'bill_month' => 'required|string',
            'year' => 'required',
            'amount' => 'required',
            'customer_id' => 'required',
        ]);

        $bill = new Bill();
        $bill->bill_month = $request->bill_month;
        $bill->year = $request->year;
        $bill->amount = $request->amount;
        $bill->customer_id = $request->customer_id;
        $bill->save();

        SendMail::dispatch($bill->id);

        return DB::table('bills')->join('customers', 'customers.id', '=', 'bills.customer_id')
            ->select('customers.name as customerName', 'customers.email as customerEmail', 'bills.*')->where('bills.id', $bill->id)->first();
    }

    public function billStatus(Request $request)
    {
        $this->validate($request, [
            'id' => 'required',
            'newData' => 'required',
        ]);
        DB::table('bills')
            ->where('id', $request->id)
            ->update([
                'status' => (int)$request->newData,
            ]);
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'bill_month' => 'required|string',
            'year' => 'required',
            'amount' => 'required',
            'customer_id' => 'required',
        ]);

        $bill = Bill::findOrFail($id);
        $bill->bill_month = $request->bill_month;
        $bill->year = $request->year;
        $bill->amount = $request->amount;
        $bill->customer_id = $request->customer_id;
        $bill->save();

        return DB::table('bills')->join('customers', 'customers.id', '=', 'bills.customer_id')
            ->select('customers.name as customerName', 'customers.email as customerEmail', 'bills.*')->where('bills.id', $bill->id)->first();
    }

    public function destroy($id)
    {
        Bill::findOrFail($id)->delete();
        return response()->json(['result' => 'Success', 'message' => 'Customer bill has been deleted'], 200);
    }
}
