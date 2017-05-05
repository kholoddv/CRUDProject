package com.myspringapp.mvc.controller;

import com.myspringapp.mvc.model.User;
import com.myspringapp.mvc.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Controller
public class UserController {
    private UserService userService;

    @Autowired(required = true)
    @Qualifier(value = "userService")
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping(value = "users")
    public ModelAndView listUsers(@RequestParam(required = false, value = "page") Integer page) {
        ModelAndView modelAndView = new ModelAndView("/users");
        List<User> listUsers = this.userService.listUsers();
        pagination(page, modelAndView, listUsers);

        modelAndView.addObject("user", new User());

        return modelAndView;
    }

    @RequestMapping(value = "add")
    public String addPage(Model model) {
        model.addAttribute("user", new User());

        return "add";
    }

    @RequestMapping(value = "edit/{id}")
    public String editPage(@PathVariable("id") int id, Model model) {
        model.addAttribute("user", this.userService.getUserById(id));

        return "edit";
    }

    @RequestMapping(value = "search", method = RequestMethod.GET)
    public ModelAndView search(@RequestParam("name") String name, @RequestParam(required = false) Integer page) {
        ModelAndView modelAndView = new ModelAndView("search");
        List<User> listUsers = userService.listUsers();

        List<User> newListUsers = new ArrayList<User>();
        for (User u : listUsers) {
            if (name.toLowerCase().equals(u.getName().toLowerCase())) {
                newListUsers.add(u);
            }
        }

        pagination(page, modelAndView, newListUsers);

        modelAndView.addObject("name", name);

        return modelAndView;
    }

    @RequestMapping(value = "addUser", method = RequestMethod.POST)
    public String addUser(@ModelAttribute("user") User user, Model model) {
        this.userService.addUser(user);
        model.addAttribute("user", new User());

        return "add";
    }

    @RequestMapping("/removeUser/{id}")
    public ModelAndView removeUser(@PathVariable("id") int id, @RequestParam(required = false) Integer page) {
        this.userService.removeUser(id);

        return listUsers(page);
    }

    @RequestMapping(value = "editUser", method = RequestMethod.POST)
    public String editUser(@ModelAttribute("user") User user) {
        this.userService.updateUser(user);

        return "redirect: users";
    }

    private ModelAndView pagination(Integer page, ModelAndView modelAndView, List<User> listUsers) {
        PagedListHolder<User> pagedListHolder = new PagedListHolder<User>(listUsers);
        pagedListHolder.setPageSize(10);
        modelAndView.addObject("maxPages", pagedListHolder.getPageCount());

        if (page == null || page < 1 || page > pagedListHolder.getPageCount()) {
            page = 1;
        }

        modelAndView.addObject("page", page);

        if (page > pagedListHolder.getPageCount()) {
            pagedListHolder.setPage(0);
            modelAndView.addObject("listUsers", pagedListHolder.getPageList());
        } else {
            pagedListHolder.setPage(page - 1);
            modelAndView.addObject("listUsers", pagedListHolder.getPageList());
        }

        return modelAndView;
    }

}
