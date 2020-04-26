package com.master4.controllers;


import com.master4.entities.User;
import com.master4.exceptions.ResourceNotFoundException;
import com.master4.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.Optional;
import org.aspectj.lang.annotation.Aspect;

@Controller
@RequestMapping(value = {"","/user"})
@Aspect
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping(value = {"/","/page/{id}"})
    public String home(@PathVariable(name="id",required = false) Optional<Integer> id, ModelMap model)
    {
        Page<User> pages = userService.getAllUser(id, 4, "id");
        model.addAttribute("pageable", pages);
        return "user/list";
    }


    @GetMapping("/add")
    public String add(ModelMap model,User User) {
        model.addAttribute("User", User);
        return "user/add";
    }

    @GetMapping("/add/{id}")
    public String edit(@PathVariable("id") long id, ModelMap model) throws ResourceNotFoundException {
        model.addAttribute("User", userService.findById(id));
        return "user/add";
    }

    @PostMapping("/save")
    public String saveTag(@Valid @ModelAttribute("User") User User, BindingResult result, ModelMap model) throws ResourceNotFoundException {
        if(result.hasErrors()){
            model.addAttribute("User",User);
            return "user/add";
        }
        userService.save(User);
        return "redirect:/User/";
    }

    @GetMapping("/delete/{page}/{id}")
    public String delete(@PathVariable("page") long page,@PathVariable("id") long id, ModelMap model) throws ResourceNotFoundException {
        userService.deleteById(id);
        return "redirect:/user/page/"+page;
    }


    @PostMapping("/login")
    public String login(@ModelAttribute("user") User user, BindingResult result, ModelMap model , HttpSession session) throws ResourceNotFoundException {
        if(result.hasErrors()){
            model.addAttribute("user",user);
            System.out.println(result);
            return "user/login";
        }
        return "user/login";
    }

}
