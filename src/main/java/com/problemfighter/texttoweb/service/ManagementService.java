package com.problemfighter.texttoweb.service;

import com.problemfighter.texttoweb.common.TextToWebException;
import com.problemfighter.texttoweb.template.FreemarkerTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.LinkedHashMap;
import java.util.Map;


@Service
public class ManagementService {

    @Autowired
    private FreemarkerTemplate freemarkerTemplate;


    private String render(String templateName) {
        return render(templateName, new LinkedHashMap<>());
    }

    private String render(String templateName, Map<String, Object> params) {
        try {
            return freemarkerTemplate.processTextClassPath("/templates/", templateName + ".ftl", params);
        } catch (TextToWebException e) {
            e.printStackTrace();
        }
        return "Internal Error";
    }

    public String dashboard() {
        return render("dashboard");
    }

    public String editor() {
        return render("editor");
    }
}
