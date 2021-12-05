<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<main class="form-signin">
  <form id="formData">
    <!-- <img class="mb-4" src="../assets/brand/bootstrap-logo.svg" alt="" width="72" height="57"> -->
    <h1 class="h3 mb-3 fw-normal">GYM CARRY</h1>
    <h1 class="h3 mb-3 fw-normal">로그인</h1>

    <div class="form-floating">
      <input type="text" class="form-control" id="id" name="id" placeholder="text">
      <label for="floatingInput">Id</label>
    </div>
    <div class="form-floating">
      <input type="password" class="form-control" id="pw" name="pw" placeholder="Password">
      <label for="floatingPassword">Password</label>
    </div>

    <div class="checkbox mb-3">
      <label>
        <input type="checkbox" value="remember-me" id="id_save" name="id_save" ${checked}> 아이디 저장
      </label>
    </div>
    <button class="w-100 btn btn-lg btn-primary" type="submit" id="submitBtn">Sign in</button>
    <p class="mt-5 mb-3 text-muted">&copy; 2021–2022</p>
  </form>
</main>