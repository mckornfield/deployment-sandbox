    /* Tables, where Case represents a hypothetical record of cases */
	create table `Case` (
        `CaseID` integer not null auto_increment,
        `CaseField1` varchar(255),
        `CaseField2` varchar(255),
        primary key (`CaseID`)
    ) ENGINE=InnoDB;
	
	create table `CaseUserAssociation` (
	`CaseUserAssociationID` integer not null auto_increment,
	`CaseID` integer,
	`Username` varchar(255),
	primary key (`CaseUserAssociationID`)
    ) ENGINE=InnoDB;
	
	/* View */
	create VIEW `Case_and_Username_VW`
	AS
	select
		a.`CaseID`,
		a.`CaseField1`,
		a.`CaseField2`,
		b.`Username`

	from `Case` a
	left join `CaseUserAssociation` b on (a.`CaseID` = b.`CaseID`);

	/* Indexes */
	CREATE INDEX index_CaseUserAssociation_CaseID On CaseUserAssociation (CaseID);
	CREATE INDEX index_CaseUserAssociation_Username On CaseUserAssociation (Username);