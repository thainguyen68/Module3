<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html>
<link rel="stylesheet" href="index.css">

<body>
<form id="form_table" action="/login" method="post">
    <div class="login">
        <h2 class="login_title">Login here !</h2>
        <div class="login_input">
            <input class="login_input--inner" type="text" name="username" placeholder="username"/>
        </div>
        <div class="login_input" >
            <input class="login_input--inner" type="password" name="password"  placeholder="password"/>
        </div>
        <div class="login_input1">
            <input class="login_button" type="submit" value="Sign in"/>
        </div>
    </div>
</form>
</body>
</html>