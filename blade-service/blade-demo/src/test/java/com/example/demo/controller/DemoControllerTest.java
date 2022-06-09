package com.example.demo.controller;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.junit.MockitoJUnitRunner;

@RunWith(MockitoJUnitRunner.class)
public class DemoControllerTest {

	@InjectMocks
	private DemoController demoController;

	@Test
	public void testGetName(){
		Assert.assertNull(demoController.getName());
	}
}
