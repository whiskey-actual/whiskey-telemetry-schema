CREATE TABLE [dbo].[Criticality] (
    [CriticalityID]                 UNIQUEIDENTIFIER    NOT NULL    DEFAULT NEWSEQUENTIALID(),
    [CriticalityLabel]              VARCHAR(16)         NOT NULL,
    CONSTRAINT [PK_Criticality] PRIMARY KEY NONCLUSTERED ([CriticalityID] DESC),
);
GO

CREATE UNIQUE NONCLUSTERED INDEX [IDX_Criticality_CriticalityLabel] ON [dbo].[Criticality]([CriticalityLabel] DESC);
GO

INSERT INTO Criticality(CriticalityLabel) VALUES ('DEBUG');
INSERT INTO Criticality(CriticalityLabel) VALUES ('INFO');
INSERT INTO Criticality(CriticalityLabel) VALUES ('OK');
INSERT INTO Criticality(CriticalityLabel) VALUES ('WARNING');
INSERT INTO Criticality(CriticalityLabel) VALUES ('ERROR');
INSERT INTO Criticality(CriticalityLabel) VALUES ('CHANGE');
INSERT INTO Criticality(CriticalityLabel) VALUES ('ADD');
GO