package boot.sist.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boot.sist.mapper.QNAboardMapperInter;

@Service
public class QNAboardService implements QNAboardServiceInter {

	@Autowired
	QNAboardMapperInter mapperInter;
	
}