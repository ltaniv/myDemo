package com.company.demo.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by admin on 2017-03-06.
 */
@RestController
public class Test {

    @RequestMapping(value = "/test/to.do", method = RequestMethod.GET)
    public ModelAndView toMethod(HttpServletRequest request, HttpServletResponse response) {
        return new ModelAndView("/test/to_vm");
    }

}
