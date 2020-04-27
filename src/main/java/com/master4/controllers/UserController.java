package com.master4.controllers;


import com.master4.entities.User;
import com.master4.exceptions.ResourceNotFoundException;
import com.master4.security.SHA1;
import com.master4.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.sql.Timestamp;
import java.util.Optional;
import org.aspectj.lang.annotation.Aspect;

@Controller
@RequestMapping(value = {"","/user"})
@Aspect
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping(value = {"/list", "/page/{id}"})
    public String home(@PathVariable(name="id",required = false) Optional<Integer> id, ModelMap model)
    {
        Page<User> pages = userService.getAllUser(id, 4, "id");
        model.addAttribute("pageable", pages);
        return "user/user-liste";
    }


    @GetMapping("/add")
    public String add(ModelMap model,User User) {
        model.addAttribute("user", User);
        return "user/user-edite";
    }

    @GetMapping("/add/{id}")
    public String edit(@PathVariable("id") long id, ModelMap model) throws ResourceNotFoundException {
        User user = userService.findById(id);
        user.setPassword(null);
        model.addAttribute("user", user);
        return "user/user-edite";
    }

    @PostMapping("/save")
    public String saveUser(@Valid @ModelAttribute("User") User user, BindingResult result, ModelMap model) throws ResourceNotFoundException , Exception{
        if(result.hasErrors()){
            model.addAttribute("user",user);
            return "user/user-edite";
        }
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());

        if (user.getCreated() == null && user.getModified() == null){
            user.setCreated(timestamp);
            user.setModified(timestamp);
        }else{
            user.setModified(timestamp);
        }
        user.setPassword(SHA1.getSHA1(user.getPassword()));
        userService.save(user);
        return "redirect:/user/list";
    }

    @GetMapping("/delete/{page}/{id}")
    public String delete(@PathVariable("page") long page,@PathVariable("id") long id, ModelMap model) throws ResourceNotFoundException {
        userService.deleteById(id);
        return "redirect:/user/page/"+page;
    }

    @GetMapping(value = {""})
    public String index( ModelMap model ,User user){
        model.addAttribute("user", user);
        return "user/user-login";
    }

    @PostMapping(value = {"/login"})
    public String login(@ModelAttribute("user") User user, BindingResult result, ModelMap model , HttpSession session) throws ResourceNotFoundException, Exception {
        if(result.hasErrors()){
            model.addAttribute("user",user);
            System.out.println(result);
            return "user/user-login";
        }
        String hachedPass = SHA1.getSHA1(user.getPassword());

        if(userService.loginCheck(user.getEmail(), hachedPass)){
            System.out.println("Welcome Back");
            session.setAttribute("fullName", userService.findByEmail(user.getEmail()).getNom()+" " + userService.findByEmail(user.getEmail()).getPrenom());
            session.setAttribute("role", userService.findByEmail(user.getEmail()).getRole());
            session.setAttribute("ConnectedUser", userService.findByEmail(user.getEmail()));
            session.setAttribute("image", "madeon.jpg");
            return "redirect:/article/";
        }else{
            user.setEmail(null);
            user.setPassword(null);
            System.out.println("Unvailable");
            return "user/user-login";
        }

    }

    @GetMapping(value = {"/register"})
    public String register( ModelMap model ,User user){
        model.addAttribute("user", user);
        return "user/user-register";
    }

    @PostMapping(value = {"/inscription"})
    public String Inscription(@Valid @ModelAttribute("user") User user, BindingResult result, ModelMap model , HttpSession session) throws ResourceNotFoundException {
        if(result.hasErrors()){
            model.addAttribute("user",user);
            System.out.println(result);
            return "user/user-register";
        }
        try{
            user.setPassword(SHA1.getSHA1(user.getPassword()));
            Timestamp timestamp = new Timestamp(System.currentTimeMillis());
            user.setCreated(timestamp);
            user.setRole("Writer");
            userService.save(user);
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            user.setPassword(null);
            return "user/user-login";
        }


    }


}
