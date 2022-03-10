<?php

namespace App\Http\Controllers;

use App\Models\Bill;
use App\Models\Customer;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class CustomerController extends Controller
{
    public function index()
    {
        return DB::table('customers')->select('id', 'name', 'email', 'address')->get();
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:50',
            'email' => 'required|email|max:50|unique:customers,email',
            'password' => 'required',
            'address' => 'required',
        ]);

        $customer = new Customer();
        $customer->name = $request->name;
        $customer->email = $request->email;
        $customer->address = $request->address;
        $customer->password = app('hash')->make($request->password);
        $customer->save();

        return Customer::findOrFail($customer->id);
    }

    public function show($id)
    {
        //
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'name' => 'required|string|max:50',
            'email' => 'required|email|max:50|unique:customers,email,' . $id,
            'password' => 'required',
            'address' => 'required',
        ]);

        $customer = Customer::findOrFail($id);
        $customer->name = $request->name;
        $customer->email = $request->email;
        $customer->address = $request->address;
        $customer->password = app('hash')->make($request->password);
        $customer->save();

        return $customer;
    }

    public function destroy($id)
    {
        $product = Bill::where('customer_id', $id)->first();
        if ($product) return response()->json(['result' => 'Error', 'message' => 'Customer already used create a bill'], 200);

        Customer::findOrFail($id)->delete();
        return response()->json(['result' => 'Success', 'message' => 'Customer has been deleted'], 200);
    }
}
