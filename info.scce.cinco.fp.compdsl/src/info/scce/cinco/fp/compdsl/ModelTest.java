package info.scce.cinco.fp.compdsl;

import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import info.scce.cinco.fp.compdsl.componentDsl.CPU;
import info.scce.cinco.fp.compdsl.componentDsl.ComponentDslFactory;
import info.scce.cinco.fp.compdsl.componentDsl.Mainboard;
import info.scce.cinco.fp.compdsl.componentDsl.PC;

public class ModelTest {

	ComponentDslFactory factory;
	PC pc;
	

	@Before
	public void setUp() throws Exception {
		factory= ComponentDslFactory.eINSTANCE;
		pc= factory.createPC();
		
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void test() {
		//Test for PC
		Assert.assertTrue(pc.getCpu().isEmpty());
		CPU cpu =factory.createCPU();
		cpu.setName("eins");
		pc.getCpu().add(cpu);
		Assert.assertTrue(pc.getCpu().contains(cpu));
		
		//Test for Mainboard
		Assert.assertTrue(pc.getMainboard().isEmpty());
		Mainboard mainboard=factory.createMainboard();
		mainboard.setName("zwei");
		pc.getMainboard().add(mainboard);
		Assert.assertTrue(pc.getMainboard().contains(mainboard));
	}

}
