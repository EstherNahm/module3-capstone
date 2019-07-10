package com.techelevator.npgeek.model;

import java.util.List;

public interface ParkDAO {
	public List<Park> getParks();
	public Park getParkByCode(String parkCode);
}
