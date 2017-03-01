package com.jongpak.groovy_template.controller;

import java.io.IOException;
import java.util.Map;

import org.codehaus.groovy.control.CompilationFailedException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jongpak.groovy_template.model.RenderData;

import groovy.lang.GroovyShell;
import groovy.text.StreamingTemplateEngine;
import groovy.text.Template;

@Controller
public class RenderController {
    @PostMapping("/render")
    @ResponseBody
    public Object render(@ModelAttribute RenderData renderData)
            throws CompilationFailedException, ClassNotFoundException, IOException {
        Object result = scriptRun(renderData.getScript());

        return renderTemplate(renderData.getTemplate(), (Map) result);
    }

    private Object scriptRun(String scriptText) {
        GroovyShell shell = new GroovyShell();
        return shell.evaluate(scriptText);
    }

    private String renderTemplate(String templateText, Map bindingData)
            throws CompilationFailedException, ClassNotFoundException, IOException {
        StreamingTemplateEngine engine = new StreamingTemplateEngine();
        Template template = engine.createTemplate(templateText);

        return template.make(bindingData).toString();
    }
}
