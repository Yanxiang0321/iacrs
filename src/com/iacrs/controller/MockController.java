package com.iacrs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mock")
public class MockController extends BaseController
{
    @RequestMapping("/forward_mock")
    public String forwardMock()
    {
        return "mock/mock";
    }
}
