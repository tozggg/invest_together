package bit.it.into.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;

import bit.it.into.dto.BondDTO;
import bit.it.into.mapper.BondMapper;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BondServiceImpl implements BondService {
	
	@Inject
	private BondMapper mapper;

	@Override
	public List<BondDTO> getList(int member_num) throws Exception {
		return mapper.getList(member_num);
	}

	@Override
	public void writeBond(BondDTO bondDTO) {
		mapper.writeBond(bondDTO);
	}

	@Override
	public void remove(String bond_num) {
		mapper.delete(bond_num);
		
	}

	@Override
	public void update(BondDTO bondDTO) throws Exception{        
        mapper.update(bondDTO);
    }

	@Override
	public Map<String, String> validateHandling(Errors errors) {
		log.info("BondService - validateHandling()");
		
		Map<String, String> validatorResult = new HashMap<>();

        for (FieldError error : errors.getFieldErrors()) {
            String validKeyName = String.format("valid_%s", error.getField());
            validatorResult.put(validKeyName, error.getDefaultMessage());
        }

        return validatorResult;
	}

	
	
}