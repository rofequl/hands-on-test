<!DOCTYPE html>
<html lang="en-US">
<head>
    <meta charset="utf-8">
    <title>Verify your email address</title>
</head>
<body>

<div>
    <table width="700" border="0" align="center" cellspacing="0" style="width:700px">
        <tbody>
        <tr>
            <td>
                <div style="width:700px;border-bottom:1px solid #cccccc;margin: 0 auto 30px;">
                </div>
                <div style="width:680px;padding:0 10px;margin:0 auto">
                    <div style="line-height:1.5;font-size:14px;margin-bottom:25px;color:#4d4d4d">
                        <strong style="display:block;margin-bottom:15px">
                            Dear {{$customer->name}},
                        </strong>
                    </div>

                    <div style="margin-bottom:30px">
                        <small style="display:block;margin-bottom:20px;font-size:12px">
                            <p style="color:#747474">
                                I hope you are well.<br><br>

                                Please see attached the invoice for completed project. The invoice is due by {{$bill->created_at}}.<br>

                                Please don't hesitate to get in touch if you have any questions or need clarifications.<br><br>

                                Best regards,<br>
                                MD NAYEM
                            </p>
                        </small>
                    </div>
                </div>
                <div style="width:700px;margin:0 auto">
                    <div
                        style="padding:10px 10px 0;border-top:1px solid #cccccc;color:#747474;margin-bottom:20px;line-height:1.3em;font-size:12.0px">
                        <p>2022 Nayem Ltd. All rights reserved.</p>
                    </div>
                </div>
            </td>
        </tr>
        </tbody>
    </table>


    <br/>
</div>

</body>
</html>
