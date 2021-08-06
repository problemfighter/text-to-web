package com.problemfighter.texttoweb.template;

import com.problemfighter.texttoweb.common.TextToWebException;
import freemarker.cache.NullCacheStorage;
import freemarker.template.*;
import org.springframework.stereotype.Service;

import java.io.*;
import java.util.LinkedHashMap;
import java.util.Map;

@Service
public class FreemarkerTemplate {

    private Configuration getConfiguration() {
        Configuration configuration = new Configuration(Configuration.VERSION_2_3_30);
        configuration.setDefaultEncoding("UTF-8");
        configuration.setTemplateExceptionHandler(TemplateExceptionHandler.RETHROW_HANDLER);
        configuration.setLogTemplateExceptions(false);
        configuration.setWrapUncheckedExceptions(false);
        configuration.setFallbackOnNullLoopVariable(false);

        DefaultObjectWrapper wrapper = new DefaultObjectWrapper(new Version("2.3.27"));
        wrapper.setExposeFields(true);
        configuration.setObjectWrapper(wrapper);

        // Disable Cache
        configuration.setCacheStorage(new NullCacheStorage());
        configuration.setTemplateUpdateDelayMilliseconds(0);

        return configuration;
    }


    public String processText(String template) throws TextToWebException {
        return processText(template, new LinkedHashMap<>(), "templateName");
    }

    public String processText(String template, Map<String, Object> params, String templateName) throws TextToWebException {
        try {
            Template templateProcessor = new Template(templateName, new StringReader(template), getConfiguration());
            Writer output = new StringWriter();
            templateProcessor.process(params, output);
            return output.toString();
        } catch (Exception e) {
            throw new TextToWebException(e.getMessage());
        }
    }

    public String processTextWithTemplateDir(String templatePath, String templateName) throws TextToWebException {
        return processTextWithTemplateDir(templatePath, templateName, new LinkedHashMap<>());
    }


    public String processTextWithTemplateDir(String templatePath, String templateName, Map<String, Object> params) throws TextToWebException {
        try {
            Configuration configuration = getConfiguration();
            configuration.setDirectoryForTemplateLoading(new File(templatePath));
            return processTextByScan(configuration, templateName, params);
        } catch (IOException e) {
            throw new TextToWebException(e.getMessage());
        }
    }

    public String processTextClassPath(String templatePath, String templateName) throws TextToWebException {
        return processTextClassPath(templatePath, templateName, new LinkedHashMap<>());
    }

    public String processTextClassPath(String templatePath, String templateName, Map<String, Object> params) throws TextToWebException {
        Configuration configuration = getConfiguration();
        configuration.setClassForTemplateLoading(this.getClass(), templatePath);
        return processTextByScan(configuration, templateName, params);
    }

    private String processTextByScan(Configuration configuration, String templateName) throws TextToWebException {
        return processTextByScan(configuration, templateName, new LinkedHashMap<>());
    }

    private String processTextByScan(Configuration configuration, String templateName, Map<String, Object> params) throws TextToWebException {
        try {
            Template templateProcessor = configuration.getTemplate(templateName);
            Writer output = new StringWriter();
            templateProcessor.process(params, output);
            return output.toString();
        } catch (Exception e) {
            throw new TextToWebException(e.getMessage());
        }
    }
}
