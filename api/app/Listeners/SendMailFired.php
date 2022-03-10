<?php

namespace App\Listeners;

use App\Events\SendMail;
use App\Models\Bill;
use App\Models\Customer;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Support\Facades\Mail;

class SendMailFired
{
    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     *
     * @param \App\Events\SendMail $event
     * @return void
     */
    public function handle(SendMail $event)
    {
        $bill = Bill::find($event->bill);
        $customer = Customer::find($bill->customer_id);
        $subject = 'You have new bill due on ' . $bill->bill_month;
        Mail::send('emails.bill', ['customer' => $customer, 'bill' => $bill],
            function ($mail) use ($customer, $subject) {
                $mail->from("rofequlislamnayem@gmail.com", "Nayem");
                $mail->to($customer->email, $customer->name);
                $mail->subject($subject);
            });
    }
}
