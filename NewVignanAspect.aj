package com;

public aspect NewVignanAspect
{
	pointcut vignanPointCut(): execution(public void onReceive(..,..)) && target(com.MaliciousCode);

	void around(): vignanPointCut()
	{

	}
}
