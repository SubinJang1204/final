package boot.sist.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boot.sist.mapper.AlbaMapperInter;

@Service
public class AlbaService implements AlbaServiceInter {

	@Autowired
AlbaMapperInter mapperInter;
	
	@Override
	public int getTotalCount() {
		
		return mapperInter.getTotalCount();
	}
}
