package rldev.signaltable.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import rldev.signaltable.entity.*;
import rldev.signaltable.service.*;

import java.util.List;

@Controller
@RequestMapping("/")
public class ProcessControlObjectController {

    @Autowired private ProcessControlObjectService processControlObjectService;
    @Autowired private DigitalInputService digitalInputService;
    @Autowired private DigitalOutputService digitalOutputService;
    @Autowired private AnalogInputService analogInputService;
    @Autowired AnalogOutputService analogOutputService;

    @RequestMapping(value = {"/{dirName}"}, method = RequestMethod.GET)
    public String directionObjects(ModelMap modelMap, @PathVariable String dirName) {
        List<ProcessControlObject> processControlObjects = processControlObjectService.getByDepartmentName(dirName);
        modelMap.addAttribute("processControlObjects", processControlObjects);
        return "signaltable/ProcessControlObject/objs";
    }

    /* ************************************************************Download excel************************************************************ */
    @RequestMapping(value = "/{objName}_signals.xls", method = RequestMethod.GET)
    public ModelAndView downloadExcel(@PathVariable String objName) {

        ProcessControlObject processControlObject = processControlObjectService.getByName(objName);

        processControlObject.setDigitalInputs(digitalInputService.getByProcessControlObjectName(objName));
        processControlObject.setAnalogInputs(analogInputService.getByProcessControlObjectName(objName));
        processControlObject.setDigitalOutputs(digitalOutputService.getByProcessControlObjectName(objName));
        processControlObject.setAnalogOutputs(analogOutputService.getByProcessControlObjectName(objName));

        return new ModelAndView("excelView", "processControlObject", processControlObject);
    }
}
