package org.nulljump.dionysos.store.controller;

import org.nulljump.dionysos.review.controller.ReviewController;
import org.nulljump.dionysos.store.model.service.StoreService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class StoreController {

	private static final Logger logger = LoggerFactory.getLogger(StoreController.class);

	@Autowired
	private StoreService storeService;
	
	public StoreController(StoreService stroeService) {
		this.storeService = storeService;
	}
	
}
