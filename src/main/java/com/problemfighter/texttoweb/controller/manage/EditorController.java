package com.problemfighter.texttoweb.controller.manage;


import com.problemfighter.texttoweb.service.ManagementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/editor")
public class EditorController {

    @Autowired
    ManagementService managementService;

    @RequestMapping(value = {"", "/"})
    @ResponseBody
    String bismillah() {
        return managementService.editor();
    }

}
