trigger tr_Account_Before on Account (before delete, before insert, before update) {

	List<ID> insertedAccountIds = new List<ID>();
	List<ID> deletedAccountIds = new List<ID>();
	List<ID> updatedAccountIds = new List<ID>();
	

	if (Trigger.isDelete){
		for (Account acc : Trigger.new){
			deletedAccountIds.add(acc.id);
		}
	}

	if (deletedAccountIds.size()>0){
		bl_Account.removeRelatedDataForDeletedAccount(deletedAccountIds);
	}


}