BEGIN;

CREATE TYPE ausstellgrund_t AS ENUM (
	'Neubau',
	'Vermietung',
	'Verkauf',
	'Modernisierung',
	'Aushang',
	'Sonstiges'
);

CREATE TYPE keller_beheizt_t AS ENUM ('Nicht Vorhanden', 'Beheizt', 'Unbeheizt');

CREATE TYPE dachgeschoss_t AS ENUM ('Nicht Vorhanden', 'Beheizt', 'Unbeheizt');

CREATE TABLE IF NOT EXISTS public.ausweise (
	id integer NOT NULL GENERATED ALWAYS AS IDENTITY (
		INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1
	),
	regnummer character varying(20) NOT NULL,
	Kontrollupload character varying(500) NOT NULL,
	public_id character varying(16) NOT NULL,
	erledigt integer NOT NULL DEFAULT 0,
	resellercode character varying(32) NOT NULL DEFAULT 'deb2241e01b5ce1d0d7021c8989c57',
	firma character varying(100) DEFAULT NULL,
	anrede character varying(35) DEFAULT NULL,
	name character varying(80) DEFAULT NULL,
	vorname character varying(30) DEFAULT NULL,
	strasse character varying(40) DEFAULT NULL,
	plz character varying(10) DEFAULT NULL,
	ort character varying(40) DEFAULT NULL,
	versand_firma character varying(100) NOT NULL,
	abweichende_versandadresse smallint NOT NULL,
	zusatzzeile character varying(80) NOT NULL,
	versand_zusatzzeile character varying(80) NOT NULL,
	versand_strasse character varying(40) NOT NULL,
	versand_plz character varying(10) NOT NULL,
	versand_ort character varying(40) NOT NULL,
	versand_email character varying(100) NOT NULL,
	email character varying(100) DEFAULT NULL,
	telefonnummer character varying(40) DEFAULT NULL,
	objekt_typ character varying(80) NOT NULL,
	objekt_plz character varying(10) NOT NULL,
	objekt_ort character varying(40) NOT NULL,
	objekt_strasse character varying(100) NOT NULL,
	objekt_gebaeudeteil character varying(20) NOT NULL,
	baujahr_gebaeude character varying(30) NOT NULL,
	baujahr_anlage character varying(30) NOT NULL,
	anzahl_einheiten character varying(30) NOT NULL,
	erstellungsdatum timestamp(0) NOT NULL DEFAULT NOW(),
	ausstellgrund ausstellgrund_t DEFAULT 'Vermietung',
	datenerhebung_durch_eigentuemer smallint NOT NULL DEFAULT 1,
	anstempel character varying(1) NOT NULL,
	wohnflaeche double precision NOT NULL,
	leerstand double precision NOT NULL,
	klimagegend character varying(30) NOT NULL,
	keller_beheizt keller_beheizt_t NOT NULL,
	dachgeschoss dachgeschoss_t NOT NULL,
	warmwasser_enthalten smallint DEFAULT 0,
	anteil_warmwasser_1 double precision DEFAULT 0.18,
	anteil_warmwasser_2 double precision DEFAULT NULL,
	wird_gekuehlt smallint NOT NULL,
	alheizung smallint NOT NULL,
	alwarmwasser smallint NOT NULL,
	allueftung smallint NOT NULL,
	alkuehlung smallint NOT NULL,
	lueftungskonzept character varying(60) NOT NULL,
	energietraeger_einheit_heizquelle_1 character varying(6) DEFAULT 'kWh',
	energietraeger_einheit_heizquelle_2 character varying(6) DEFAULT 'kWh',
	energietraeger_1 character varying(20) NOT NULL,
	energietraeger_2 character varying(20) DEFAULT NULL,
	energieverbrauch_zeitraum_monat decimal(2, 0) NOT NULL,
	energieverbrauch_zeitraum_jahr decimal(4, 0) NOT NULL,
	energieverbrauch_1_heizquelle_1 integer DEFAULT NULL,
	energieverbrauch_2_heizquelle_1 integer DEFAULT NULL,
	energieverbrauch_3_heizquelle_1 integer DEFAULT NULL,
	energieverbrauch_1_heizquelle_2 integer DEFAULT NULL,
	energieverbrauch_2_heizquelle_2 integer DEFAULT NULL,
	energieverbrauch_3_heizquelle_2 integer DEFAULT NULL,
	nwheizung character varying(1) NOT NULL,
	nwwarmwasser character varying(1) NOT NULL,
	nwlueftung character varying(1) NOT NULL,
	nwbeleuchtung character varying(1) NOT NULL,
	nwkuehlung character varying(1) NOT NULL,
	nwsonstiges character varying(1) NOT NULL,
	nwsonstigese character varying(40) NOT NULL,
	objekt_saniert smallint DEFAULT 0,
	preis decimal(6, 2) NOT NULL,
	QD character varying(1) NOT NULL,
	AH character varying(1) NOT NULL,
	NA character varying(1) NOT NULL,
	SD character varying(1) NOT NULL,
	MK character varying(1) NOT NULL,
	MKK character varying(1) NOT NULL DEFAULT 'x',
	bezahlstatus character varying(50) NOT NULL,
	Agb character varying(10) NOT NULL,
	Ag character varying(10) NOT NULL,
	nachricht character varying(1000) NOT NULL,
	ausweisart character varying(10) NOT NULL,
	korrektur character varying(30) NOT NULL,
	konstruktion_dach character varying(100) NOT NULL,
	daemmung_dach character varying(6) NOT NULL,
	konstruktion_og_decke character varying(100) NOT NULL,
	daemmung_og_decke character varying(6) NOT NULL,
	konstruktion_aussenwand character varying(100) NOT NULL,
	daemmung_aussenwand character varying(6) NOT NULL,
	konstruktion_boden character varying(100) NOT NULL,
	daemmung_boden character varying(6) NOT NULL,
	konstruktion_fenster_1 character varying(6) NOT NULL,
	fensterflaeche character varying(6) NOT NULL,
	konstruktion_fenster_2 character varying(6) NOT NULL,
	fensterflan character varying(6) NOT NULL,
	konstruktion_fenster_3 character varying(6) NOT NULL,
	fensterflaeche_dach character varying(6) NOT NULL,
	haustuerflaeche character varying(6) NOT NULL,
	konstruktion_haustuer character varying(6) NOT NULL,
	fensterflsosw character varying(6) NOT NULL,
	fensterflnwno character varying(6) NOT NULL,
	schuppen character varying(6) NOT NULL,
	gauben character varying(6) NOT NULL,
	angauben character varying(6) NOT NULL,
	dichtheit character varying(5) NOT NULL,
	energietraeger character varying(200) NOT NULL,
	energietraegerfa character varying(6) NOT NULL,
	energietraegerfa2 character varying(6) NOT NULL,
	nsumrechnungsfaktor character varying(6) NOT NULL,
	nsumrechnungsfaktor2 character varying(6) NOT NULL,
	verteilungww character varying(60) NOT NULL,
	speicherungww character varying(60) NOT NULL,
	werzeugungww character varying(60) NOT NULL,
	uebergabeh character varying(60) NOT NULL,
	verteilungh character varying(60) NOT NULL,
	spheizung character varying(60) NOT NULL,
	werzeugungh character varying(60) NOT NULL,
	kollektor character varying(6) NOT NULL,
	energietraeger2 character varying(20) NOT NULL,
	zusatzheizung character varying(6) NOT NULL,
	AV character varying(6) NOT NULL,
	AWA character varying(6) NOT NULL,
	AWB character varying(6) NOT NULL,
	AWD character varying(6) NOT NULL,
	AWOGD character varying(6) NOT NULL,
	UAWA character varying(6) NOT NULL,
	UAWB character varying(6) NOT NULL,
	UAWD character varying(6) NOT NULL,
	UAWOGD character varying(6) NOT NULL,
	behgv character varying(10) NOT NULL,
	wud character varying(10) NOT NULL,
	wuog character varying(10) NOT NULL,
	wuaw character varying(10) NOT NULL,
	wufbe character varying(10) NOT NULL,
	aluawd character varying(10) NOT NULL,
	aluawog character varying(10) NOT NULL,
	aluawa character varying(10) NOT NULL,
	aluawb character varying(10) NOT NULL,
	twa character varying(4) NOT NULL,
	dach character varying(4) NOT NULL,
	ogdecke character varying(4) NOT NULL,
	auwand character varying(4) NOT NULL,
	boden character varying(4) NOT NULL,
	EVK decimal(5, 1) NOT NULL,
	QI character varying(6) NOT NULL,
	QS character varying(6) NOT NULL,
	HV character varying(6) NOT NULL,
	HT character varying(6) NOT NULL,
	HTS decimal(3, 2) NOT NULL,
	QH character varying(6) NOT NULL,
	Htsan decimal(3, 2) NOT NULL,
	Htsgrenz decimal(3, 2) NOT NULL,
	Qps decimal(4, 1) NOT NULL,
	einzug character varying(20) NOT NULL,
	vertragsbeginn character varying(20) NOT NULL,
	stromanbieter character varying(40) NOT NULL,
	kundennummer character varying(20) NOT NULL,
	zaehlernummer character varying(20) NOT NULL,
	jahresverbrauch character varying(20) NOT NULL,
	personenanzahl character varying(20) NOT NULL,
	gcfiid character varying(20) NOT NULL,
	gckuid character varying(20) NOT NULL,
	leistung character varying(200) NOT NULL,
	bewertungstext character varying(3000) NOT NULL,
	anver smallint NOT NULL,
	spei smallint NOT NULL,
	kf1 character varying(4) NOT NULL,
	kf2 character varying(4) NOT NULL,
	kf3 character varying(4) NOT NULL,
	T_PEV character varying(6) NOT NULL,
	T_PEVNW character varying(6) NOT NULL,
	heizwertfaktor decimal(3, 2) NOT NULL,
	heizwertfaktor_1 decimal(3, 2) NOT NULL,
	zusaetzliche_heizquelle smallint DEFAULT NULL,
	ausweis_gespeichert smallint NOT NULL DEFAULT 0,
	datenblatt_gespeichert smallint NOT NULL DEFAULT 0,
	images text NOT NULL,
	user_id integer DEFAULT NULL,
	versorgungssysteme integer NOT NULL DEFAULT 0,
	fenster_dach integer NOT NULL DEFAULT 0,
	daemmung integer NOT NULL DEFAULT 0,
	energiequelle_2_nutzung integer NOT NULL DEFAULT 0,
	versand_adresse integer DEFAULT NULL,
	rechnung_adresse integer DEFAULT NULL,
	anzahl_vollgeschosse integer NOT NULL,
	geschosshoehe double precision NOT NULL,
	anzahl_gauben integer NOT NULL,
	breite_gauben integer NOT NULL,
	masse_a integer NOT NULL,
	masse_b integer NOT NULL,
	masse_c integer NOT NULL,
	masse_d integer NOT NULL,
	masse_e integer NOT NULL,
	masse_f integer NOT NULL,
	fensterflaeche_so_sw integer NOT NULL,
	fensterflaeche_nw_no integer NOT NULL,
	aussenwandflaeche_unbeheizt integer NOT NULL,
	dachflaeche integer NOT NULL,
	dach_u_wert integer NOT NULL,
	deckenflaeche integer NOT NULL,
	decke_u_wert integer NOT NULL,
	aussenwand_flaeche integer NOT NULL,
	aussenwand_u_wert integer NOT NULL,
	fussboden_flaeche integer NOT NULL,
	fussboden_u_wert integer NOT NULL,
	volumen integer NOT NULL,
	dicht smallint NOT NULL,
	fenster_flaeche_1 integer NOT NULL,
	fenster_art_1 character varying(45) NOT NULL,
	fenster_flaeche_2 integer NOT NULL,
	fenster_art_2 character varying(45) NOT NULL,
	dachfenster_flaeche integer NOT NULL,
	dachfenster_art character varying(45) NOT NULL,
	haustuer_flaeche integer NOT NULL,
	haustuer_art character varying(45) NOT NULL,
	dach_bauart character varying(45) NOT NULL,
	dach_daemmung integer NOT NULL,
	decke_bauart character varying(45) NOT NULL,
	decke_daemmung integer NOT NULL,
	aussenwand_bauart character varying(45) NOT NULL,
	aussenwand_daemmung integer NOT NULL,
	boden_bauart character varying(45) NOT NULL,
	boden_daemmung integer NOT NULL,
	warmwasser_verteilung character varying(45) NOT NULL,
	warmwasser_speicherung character varying(45) NOT NULL,
	warmwasser_erzeugung character varying(45) NOT NULL,
	heizung_zentral smallint NOT NULL,
	heizung_verteilung character varying(45) NOT NULL,
	heizung_speicherung character varying(45) NOT NULL,
	waerme_erzeugung_heizung character varying(45) NOT NULL,
	anteil_zusatzheizung integer NOT NULL,
	kollektor_flaeche integer NOT NULL,
	vanw_stromverbrauch_enthalten integer DEFAULT NULL,
	vanw_stromverbrauch_sonstige character varying(255) DEFAULT NULL,
	vanw_strom_1 integer DEFAULT NULL,
	vanw_strom_2 integer DEFAULT NULL,
	vanw_strom_3 integer DEFAULT NULL,
	level integer DEFAULT 4,
	CONSTRAINT "PK_AUSWEISE" PRIMARY KEY (id),
	UNIQUE(public_id)
);

INSERT INTO
	ausweise (
		regnummer,
		Kontrollupload,
		public_id,
		erledigt,
		resellercode,
		firma,
		anrede,
		name,
		vorname,
		strasse,
		plz,
		ort,
		versand_firma,
		abweichende_versandadresse,
		zusatzzeile,
		versand_zusatzzeile,
		versand_strasse,
		versand_plz,
		versand_ort,
		versand_email,
		email,
		telefonnummer,
		objekt_typ,
		objekt_plz,
		objekt_ort,
		objekt_strasse,
		objekt_gebaeudeteil,
		baujahr_gebaeude,
		baujahr_anlage,
		anzahl_einheiten,
		erstellungsdatum,
		ausstellgrund,
		datenerhebung_durch_eigentuemer,
		anstempel,
		wohnflaeche,
		leerstand,
		klimagegend,
		keller_beheizt,
		dachgeschoss,
		warmwasser_enthalten,
		anteil_warmwasser_1,
		anteil_warmwasser_2,
		wird_gekuehlt,
		alheizung,
		alwarmwasser,
		allueftung,
		alkuehlung,
		lueftungskonzept,
		energietraeger_einheit_heizquelle_1,
		energietraeger_einheit_heizquelle_2,
		energietraeger_1,
		energietraeger_2,
		energieverbrauch_zeitraum_monat,
		energieverbrauch_zeitraum_jahr,
		energieverbrauch_1_heizquelle_1,
		energieverbrauch_2_heizquelle_1,
		energieverbrauch_3_heizquelle_1,
		energieverbrauch_1_heizquelle_2,
		energieverbrauch_2_heizquelle_2,
		energieverbrauch_3_heizquelle_2,
		nwheizung,
		nwwarmwasser,
		nwlueftung,
		nwbeleuchtung,
		nwkuehlung,
		nwsonstiges,
		nwsonstigese,
		objekt_saniert,
		preis,
		QD,
		AH,
		NA,
		SD,
		MK,
		MKK,
		bezahlstatus,
		Agb,
		Ag,
		nachricht,
		ausweisart,
		korrektur,
		konstruktion_dach,
		daemmung_dach,
		konstruktion_og_decke,
		daemmung_og_decke,
		konstruktion_aussenwand,
		daemmung_aussenwand,
		konstruktion_boden,
		daemmung_boden,
		konstruktion_fenster_1,
		fensterflaeche,
		konstruktion_fenster_2,
		fensterflan,
		konstruktion_fenster_3,
		fensterflaeche_dach,
		haustuerflaeche,
		konstruktion_haustuer,
		fensterflsosw,
		fensterflnwno,
		schuppen,
		gauben,
		angauben,
		dichtheit,
		energietraeger,
		energietraegerfa,
		energietraegerfa2,
		nsumrechnungsfaktor,
		nsumrechnungsfaktor2,
		verteilungww,
		speicherungww,
		werzeugungww,
		uebergabeh,
		verteilungh,
		spheizung,
		werzeugungh,
		kollektor,
		energietraeger2,
		zusatzheizung,
		AV,
		AWA,
		AWB,
		AWD,
		AWOGD,
		UAWA,
		UAWB,
		UAWD,
		UAWOGD,
		behgv,
		wud,
		wuog,
		wuaw,
		wufbe,
		aluawd,
		aluawog,
		aluawa,
		aluawb,
		twa,
		dach,
		ogdecke,
		auwand,
		boden,
		EVK,
		QI,
		QS,
		HV,
		HT,
		HTS,
		QH,
		Htsan,
		Htsgrenz,
		Qps,
		einzug,
		vertragsbeginn,
		stromanbieter,
		kundennummer,
		zaehlernummer,
		jahresverbrauch,
		personenanzahl,
		gcfiid,
		gckuid,
		leistung,
		bewertungstext,
		anver,
		spei,
		kf1,
		kf2,
		kf3,
		T_PEV,
		T_PEVNW,
		heizwertfaktor,
		heizwertfaktor_1,
		zusaetzliche_heizquelle,
		ausweis_gespeichert,
		datenblatt_gespeichert,
		images,
		user_id,
		versorgungssysteme,
		fenster_dach,
		daemmung,
		energiequelle_2_nutzung,
		versand_adresse,
		rechnung_adresse,
		anzahl_vollgeschosse,
		geschosshoehe,
		anzahl_gauben,
		breite_gauben,
		masse_a,
		masse_b,
		masse_c,
		masse_d,
		masse_e,
		masse_f,
		fensterflaeche_so_sw,
		fensterflaeche_nw_no,
		aussenwandflaeche_unbeheizt,
		dachflaeche,
		dach_u_wert,
		deckenflaeche,
		decke_u_wert,
		aussenwand_flaeche,
		aussenwand_u_wert,
		fussboden_flaeche,
		fussboden_u_wert,
		volumen,
		dicht,
		fenster_flaeche_1,
		fenster_art_1,
		fenster_flaeche_2,
		fenster_art_2,
		dachfenster_flaeche,
		dachfenster_art,
		haustuer_flaeche,
		haustuer_art,
		dach_bauart,
		dach_daemmung,
		decke_bauart,
		decke_daemmung,
		aussenwand_bauart,
		aussenwand_daemmung,
		boden_bauart,
		boden_daemmung,
		warmwasser_verteilung,
		warmwasser_speicherung,
		warmwasser_erzeugung,
		heizung_zentral,
		heizung_verteilung,
		heizung_speicherung,
		waerme_erzeugung_heizung,
		anteil_zusatzheizung,
		kollektor_flaeche,
		vanw_stromverbrauch_enthalten,
		vanw_stromverbrauch_sonstige,
		vanw_strom_1,
		vanw_strom_2,
		vanw_strom_3,
		level
	)
VALUES
	(
		'',
		'',
		'a-d1b5-6a6ee-33d',
		0,
		'deb2241e01b5ce1d0d7021c8989c57',
		NULL,
		'Frau',
		'Utcke',
		'Léa',
		NULL,
		NULL,
		NULL,
		'',
		0,
		'',
		'',
		'',
		'',
		'',
		'',
		'letsmoe1404@gmail.com',
		'0889999999999999999',
		'Einfamilienhaus',
		'22049',
		'Hamburg',
		'Mönckebergstraße',
		'Gesamtgebäude',
		'1962',
		'1974',
		'1',
		'2023-04-13 09:57:11',
		'Vermietung',
		1,
		'',
		200,
		0,
		'',
		'Unbeheizt',
		'Unbeheizt',
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		'Fensterlüftung',
		'kWh',
		'SRm',
		'Erdgas',
		'Brennholz',
		'4',
		'2019',
		40120,
		42120,
		41120,
		6,
		6,
		6,
		'',
		'',
		'',
		'',
		'',
		'',
		'',
		1,
		'0.00',
		'',
		'',
		'',
		'',
		'',
		'x',
		'',
		'',
		'',
		'',
		'VA',
		'',
		'',
		'',
		'',
		'',
		'',
		'',
		'',
		'',
		'',
		'',
		'',
		'',
		'',
		'',
		'',
		'',
		'',
		'',
		'',
		'',
		'',
		'',
		'',
		'',
		'',
		'',
		'',
		'',
		'',
		'',
		'',
		'',
		'',
		'',
		'',
		'',
		'',
		'',
		'',
		'',
		'',
		'',
		'',
		'',
		'',
		'',
		'',
		'',
		'',
		'',
		'',
		'',
		'',
		'',
		'',
		'',
		'',
		'',
		'',
		'',
		'0.0',
		'',
		'',
		'',
		'',
		'0.00',
		'',
		'0.00',
		'0.00',
		'0.0',
		'',
		'',
		'',
		'',
		'',
		'',
		'',
		'',
		'',
		'',
		'',
		0,
		0,
		'',
		'',
		'',
		'',
		'',
		'0.00',
		'0.00',
		1,
		0,
		0,
		'{"daemmung":["1a9a7b01-d9f3-11ed-aa3e-00505698f5a6"],"general":["2702559e-d9f3-11ed-aa3e-00505698f5a6"],"fenster":["13c52524-d9f3-11ed-aa3e-00505698f5a6"],"heizung":["0c774c3c-d9f3-11ed-aa3e-00505698f5a6"]}',
		1,
		4095,
		511,
		63,
		15,
		1,
		1,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		'',
		0,
		'',
		0,
		'',
		0,
		'0',
		'',
		0,
		'',
		0,
		'',
		0,
		'',
		0,
		'',
		'',
		'',
		0,
		'',
		'',
		'',
		0,
		0,
		0,
		'',
		0,
		0,
		0,
		1
	);


ALTER TABLE
	ausweise
ADD
	CONSTRAINT FK_AUSWEIS_USER FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE ON UPDATE CASCADE,
ADD
	CONSTRAINT FK_RECHNUNG_ADRESSE FOREIGN KEY (rechnung_adresse) REFERENCES adressen (id) ON DELETE CASCADE,
ADD
	CONSTRAINT FK_VERSAND_ADRESSE FOREIGN KEY (versand_adresse) REFERENCES adressen (id) ON DELETE CASCADE;

END;