CREATE TYPE optionstrategy as enum ('SINGLE', 'ANALYTICAL', 'COVERED', 'VERTICAL', 'CALENDAR', 'STRANGLE',  'STRADDLE', 'BUTTERFLY', 'CONDOR', 'DIAGONAL', 'COLLAR', 'ROLL');
CREATE TABLE IF NOT EXISTS public.financedb_RUNHISTORY ("Id" SERIAL,"Process" VARCHAR, "Startime" DOUBLE PRECISION DEFAULT NULL, "Endtime" DOUBLE PRECISION DEFAULT NULL,"SymbolsToFetch" INT, "SymbolsInsert" INT, "LastSymbol" VARCHAR(14), "Notes" TEXT);
CREATE TYPE way as enum ('UP', 'DOWN');
CREATE TABLE IF NOT EXISTS public.tdfundamentaldata(symbol character varying(14) COLLATE pg_catalog."default" NOT NULL,high52 double precision,low52 double precision,"dividendAmount" double precision,"dividendYield" double precision,"dividendDate" timestamp without time zone,"peRatio" double precision,"pegRatio" double precision,"pbRatio" double precision,"prRatio" double precision,"pcfRatio" double precision,"grossMarginTTM" double precision,"grossMarginMRQ" double precision,"netProfitMarginTTM" double precision,"netProfitMarginMRQ" double precision,"operatingMarginTTM" double precision,"operatingMarginMRQ" double precision,"returnOnEquity" double precision,"returnOnAssets" double precision,"returnOnInvestment" double precision,"quickRatio" double precision,"currentRatio" double precision,"interestCoverage" double precision,"totalDebtToCapital" double precision,"ltDebtToEquity" double precision,"totalDebtToEquity" double precision,"epsTTM" double precision,"epsChangePercentTTM" double precision,"epsChangeYear" double precision,"epsChange" double precision,"revChangeYear" double precision,"revChangeTTM" double precision,"revChangeIn" double precision,"sharesOutstanding" double precision,"marketCapFloat" double precision,"marketCap" double precision,"bookValuePerShare" double precision,"shortIntToFloat" double precision,"shortIntDayToCover" double precision,"divGrowthRate3Year" double precision,"dividendPayAmount" double precision,"dividendPayDate" timestamp without time zone,beta double precision,"vol1DayAvg" double precision,"vol10DayAvg" double precision,"vol3MonthAvg" double precision,dateadded timestamp without time zone DEFAULT now());
CREATE TABLE IF NOT EXISTS public."tdoptionsdata"("Symbol" character varying(56), "underlyingsymbol" character varying(14), "Status" character varying(8), "strategy" optionstrategy, "Interval" float, "isDelayed" BOOLEAN, "isIndex" BOOLEAN, "interestRate" double precision, "underlyingPrice" numeric, "volatility" double precision, "underlyingVolatility" double precision, "daysToExpiration" INT, "numberOfContracts" INT, "expDate" date, "strikePrice" double precision, "type" character varying(50) COLLATE pg_catalog."default", "putCall" character varying(12), "description" character varying(108), "exchangeName" character varying(8), "bid" numeric, "ask" numeric, "last" numeric, "mark" numeric, "bidSize" numeric, "askSize" numeric, "bidAskSize" character varying(32), "lastSize" numeric, "highprice" FLOAT, "lowprice" FLOAT, "openprice" FLOAT, "closeprice" FLOAT, "totalvolume" bigint, "tradedate" text, "tradetimeinlong" bigint, "quoteTimeInLong" BIGINT, "netChange" FLOAT, "delta" double precision, "gamma" double precision, "theta" double precision, "vega" double precision, "rho" double precision, "openinterest" bigint, "timeValue" FLOAT, "theoreticalOptionValue" FLOAT, "theoreticalVolatility" FLOAT, "optionDeliverablesList" TEXT, "expirationDate" BIGINT, "expirationType" CHARACTER VARYING(10), "lastTradingDay" BIGINT, "multiplier" FLOAT, "settlementType" TEXT, "deliverableNote" TEXT, "isIndexOption" BOOLEAN, "percentChange" FLOAT, "markChange" FLOAT, "markPercentChange" FLOAT, "intrinsicValue" FLOAT, "inTheMoney" BOOLEAN, "pennyPilot" BOOLEAN, "nonStandard" BOOLEAN, "mini" BOOLEAN, "dateadded" timestamp without time zone default now());
CREATE TABLE IF NOT EXISTS public.tdmoversdata(change double precision,description text COLLATE pg_catalog."default",direction way,last double precision,"Symbol" character varying(14) COLLATE pg_catalog."default" NOT NULL,"totalVolume" bigint,"Source" character varying(6) COLLATE pg_catalog."default",dateadded timestamp without time zone DEFAULT now());
CREATE TABLE IF NOT EXISTS public.tdpricehistory_weekly(symbol character varying(14) COLLATE pg_catalog."default" NOT NULL,open double precision,high double precision,low double precision,close double precision,volume bigint,datetime bigint NOT NULL);
CREATE TABLE IF NOT EXISTS public.tdpricehistory_daily(symbol character varying(14) COLLATE pg_catalog."default" NOT NULL,open double precision,high double precision,low double precision,close double precision,volume bigint,datetime bigint NOT NULL);
CREATE TABLE IF NOT EXISTS public.tdpricehistory_min(symbol character varying(14) COLLATE pg_catalog."default" NOT NULL,open double precision,high double precision,low double precision,close double precision,volume bigint,datetime bigint NOT NULL);
CREATE TABLE IF NOT EXISTS public.tdstockmktquotedata("assetType" character varying(14) COLLATE pg_catalog."default","assetMainType" character varying(14) COLLATE pg_catalog."default",cusip character varying(15) COLLATE pg_catalog."default",symbol character varying(14) COLLATE pg_catalog."default" NOT NULL,description text COLLATE pg_catalog."default","bidPrice" double precision,"bidSize" integer,"bidId" text COLLATE pg_catalog."default","askPrice" double precision,"askSize" integer,"askId" text COLLATE pg_catalog."default","lastPrice" double precision,"lastSize" integer,"lastId" text COLLATE pg_catalog."default","openPrice" double precision,"highPrice" double precision,"lowPrice" double precision,"bidTick" double precision,"closePrice" double precision,"netChange" double precision,"totalVolume" integer,"quoteTimeInLong" bigint,"tradeTimeInLong" bigint,mark double precision,exchange character varying(30) COLLATE pg_catalog."default","exchangeName" text COLLATE pg_catalog."default",marginable boolean,shortable boolean,volatility double precision,digits integer,"52WkHigh" double precision,"52WkLow" double precision,"nAV" double precision,"peRatio" double precision,"divAmount" double precision,"divYield" double precision,"divDate" timestamp without time zone,"securityStatus" character varying(30) COLLATE pg_catalog."default","regularMarketLastPrice" double precision,"regularMarketLastSize" integer,"regularMarketNetChange" double precision,"regularMarketTradeTimeInLong" bigint,"netPercentChangeInDouble" double precision,"markChangeInDouble" double precision,"markPercentChangeInDouble" double precision,"regularMarketPercentChangeInDouble" double precision,delayed boolean,"realtimeEntitled" boolean,dateadded timestamp without time zone DEFAULT now());
CREATE TABLE IF NOT EXISTS public.iqpricehistory_daily (symbol character varying(14) NOT NULL, date date NOT NULL, high double precision, low double precision, open double precision, close double precision, volume bigint, open_interest bigint);
CREATE TABLE IF NOT EXISTS public.iqpricehistory_min (symbol character varying(14) NOT NULL, date timestamp without time zone NOT NULL, high double precision, low double precision, open double precision, close double precision, volume bigint, open_interest bigint);
CREATE TABLE public."DATASERVICEHOURS" (asset_type character varying,td_service_name character varying,td_start time with time zone,td_end time with time zone,td_delivery_type character varying);
CREATE TABLE IF NOT EXISTS public.edgarfilings( "EntityRegistrantName" text COLLATE pg_catalog."default", "FiscalYear" text COLLATE pg_catalog."default", "EntityCentralIndexKey" bigint, "EntityFilerCategory" character varying(40) COLLATE pg_catalog."default", "Symbol" text COLLATE pg_catalog."default", "DocumentFiscalYearFocus" integer, "DocumentFiscalPeriodFocus" character varying(4) COLLATE pg_catalog."default", "DocumentType" character varying(10) COLLATE pg_catalog."default", "BalanceSheetDate" date, "IncomeStatementPeriodYTD" date, "ContextForInstants" character varying(256) COLLATE pg_catalog."default", "ContextForDurations" character varying(256) COLLATE pg_catalog."default", "Assets" numeric, "CurrentAssets" numeric, "NoncurrentAssets" numeric, "LiabilitiesAndEquity" numeric, "Liabilities" numeric, "CurrentLiabilities" numeric, "NoncurrentLiabilities" numeric, "CommitmentsAndContingencies" numeric, "TemporaryEquity" numeric, "Equity" numeric, "EquityAttributableToNoncontrollingInterest" numeric, "EquityAttributableToParent" numeric, "Revenues" numeric, "CostOfRevenue" numeric, "GrossProfit" numeric, "OperatingExpenses" numeric, "CostsAndExpenses" numeric, "OtherOperatingIncome" numeric, "OperatingIncomeLoss" numeric, "NonoperatingIncomeLoss" numeric, "InterestAndDebtExpense" numeric, "IncomeBeforeEquityMethodInvestments" numeric, "IncomeFromEquityMethodInvestments" numeric, "IncomeFromContinuingOperationsBeforeTax" numeric, "IncomeTaxExpenseBenefit" numeric, "IncomeFromContinuingOperationsAfterTax" numeric, "IncomeFromDiscontinuedOperations" numeric, "ExtraordaryItemsGainLoss" numeric, "NetIncomeLoss" numeric, "NetIncomeAvailableToCommonStockholdersBasic" numeric, "PreferredStockDividendsAndOtherAdjustments" numeric, "NetIncomeAttributableToNoncontrollingInterest" numeric, "NetIncomeAttributableToParent" numeric, "OtherComprehensiveIncome" numeric, "ComprehensiveIncome" numeric, "ComprehensiveIncomeAttributableToParent" numeric, "ComprehensiveIncomeAttributableToNoncontrollingInterest" numeric, "NonoperatingIncomeLossPlusInterestAndDebtExpense" numeric, "NonoperatingIncomePlusInterestAndDebtExpensePlusIncomeFromEquit" numeric, "NetCashFlow" numeric, "NetCashFlowsOperating" numeric, "NetCashFlowsInvesting" numeric, "NetCashFlowsFinancing" numeric, "NetCashFlowsOperatingContinuing" numeric, "NetCashFlowsInvestingContinuing" numeric, "NetCashFlowsFinancingContinuing" numeric, "NetCashFlowsOperatingDiscontinued" numeric, "NetCashFlowsInvestingDiscontinued" numeric, "NetCashFlowsFinancingDiscontinued" numeric, "NetCashFlowsDiscontinued" numeric, "ExchangeGainsLosses" numeric, "NetCashFlowsContinuing" numeric, "SGR" numeric, "ROA" numeric, "ROE" numeric, "ROS" numeric, "Accession" character varying(20) COLLATE pg_catalog."default" NOT NULL, "DateAdded" timestamp without time zone DEFAULT now(), CONSTRAINT accession PRIMARY KEY ("Accession"));
CREATE TABLE IF NOT EXISTS public.edgarindex( "CIK" bigint, "NAME" character varying COLLATE pg_catalog."default", "FILING_TYPE" character varying COLLATE pg_catalog."default", "FILING_DATE" date, "TXT_LINK" character varying COLLATE pg_catalog."default", "HTML_lINK" character varying COLLATE pg_catalog."default", dateadded timestamp without time zone DEFAULT now());
CREATE TABLE IF NOT EXISTS public.edgartickerindex("CIK" bigint NOT NULL,    "SYMBOL" text COLLATE pg_catalog."default","URL" text COLLATE pg_catalog."default","ASSETTYPE" character varying(14) COLLATE pg_catalog."default","DATEADDED" timestamp without time zone DEFAULT now());
COPY public."DATASERVICEHOURS" (asset_type, td_service_name, td_start, td_end, td_delivery_type) FROM stdin;
EQUITY	QUOTE	07:30:00-05:00	20:00:00-05:00	CHANGE
OPTION	OPTION	09:30:00-05:00	16:00:00-05:00	CHANGE
FUTURE	LEVELONE_FUTURES	00:00:00-05:00	00:00:00-05:00	CHANGE
ACTIVES_OPTIONS	ACTIVES_OPTIONS	09:30:00-05:00	16:00:00-05:00	WHOLE
NASDAQ	ACTIVES_NASDAQ	07:30:00-05:00	20:00:00-05:00	WHOLE
NYSE	ACTIVES_NYSE	09:30:00-05:00	16:00:00-05:00	WHOLE
\.
