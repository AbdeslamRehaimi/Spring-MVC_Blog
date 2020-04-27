package com.master4.validators;

import com.master4.entities.User;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class CustumePassword implements ConstraintValidator<PasswordConf, User>{

    @Override
    public void initialize(PasswordConf constraintAnnotation) {

    }

    @Override
    public boolean isValid(User user, ConstraintValidatorContext constraintValidatorContext) {
        return user.getPassword().equals(user.getConfirmedPassword());
    }

    /*
    @Override
    public boolean isValid(Object value, ConstraintValidatorContext context) {
        return value.getPassword().equals(value.getConfirmedPassword());
        return user.getPassword().equals(value.getPasswordRepeat())
    }*/
}
