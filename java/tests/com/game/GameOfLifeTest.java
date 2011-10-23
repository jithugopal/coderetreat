package com.game;


import static org.junit.Assert.assertTrue;

import org.junit.Before;
import org.junit.Test;

public class GameOfLifeTest {
	
	GameOfLife gol;

	@Before
	public void setUp() throws Exception {
		gol = new GameOfLife(5);
	}
	
	@Test
	public void testLiveNeighbourCount() throws Exception {
		assertTrue(gol.liveNeighbourCount(3, 3) == 0);
	}

}
