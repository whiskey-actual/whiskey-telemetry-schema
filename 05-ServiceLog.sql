CREATE TABLE [dbo].[ServiceLog] (
    [ServiceLogID]                  UNIQUEIDENTIFIER    NOT NULL    DEFAULT NEWSEQUENTIALID(),
    [SourceID]                      UNIQUEIDENTIFIER    NOT NULL,
    [ServiceLogSeverity]            VARCHAR (255)       NOT NULL    DEFAULT ('INFO'),
    [ServiceLogComponent]           VARCHAR (255)       NOT NULL    DEFAULT ('UNKNOWN'),
    [ServiceLogMessage]             NVARCHAR(MAX)       NOT NULL,
    [ServiceLogTimestamp]           TIMESTAMP           NOT NULL,
    CONSTRAINT [PK_ServiceLog] PRIMARY KEY NONCLUSTERED ([ServiceLogID] DESC),
    CONSTRAINT [FK_ServiceLog_Source] FOREIGN KEY (SourceID) REFERENCES [dbo].[Source](SourceID)
);
GO

CREATE NONCLUSTERED INDEX [IDX_ServiceLog_ServiceLogTimestamp] ON [dbo].[ServiceLog]([ServiceLogTimestamp] DESC);
GO

CREATE NONCLUSTERED INDEX IDX_ServiceLog_ServiceLogSeverity ON ServiceLog (ServiceLogSeverity);
GO

INSERT INTO ServiceLog(
    SourceID, 
    ServiceLogSeverity, 
    ServiceLogComponent, 
    ServiceLogMessage
    )
VALUES (
    (SELECT SourceID FROM Source WHERE SourceDescription='CORE'),
    (SELECT CriticalityID FROM Criticality WHERE CriticalityLabel='INFO'),
    'CORE',
    'DB Build'
)