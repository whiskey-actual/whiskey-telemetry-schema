CREATE TABLE [dbo].[Source] (
    [SourceID]										UNIQUEIDENTIFIER    NOT NULL    DEFAULT NEWSEQUENTIALID(),
    [SourceIsActive]								BIT				    NOT NULL    DEFAULT ((1)),
    [SourceDescription]								VARCHAR(255)	    NOT NULL,
	[SourceTypeID]          						UNIQUEIDENTIFIER    NOT NULL,
    [SourceConnectionHost]							VARCHAR(255)	    NULL,
    [SourceConnectionPort]							INT				    NULL,
    [SourceUsername]								VARCHAR(255)	    NULL,
    [SourcePassword]								VARCHAR(255)	    NULL,
    [SourceQueryString]                             VARCHAR(255)        NULL,
    [SourceQueryIntervalMinutes]				    INT				    NOT NULL    DEFAULT ((1440)),
    [SourceLastQueryRun]                            TIMESTAMP,
    [SourceLastQuerySucceeded]					    BIT				    NOT NULL    DEFAULT ((0)),
    [SourceLastQueryErrorMessage]				    VARCHAR(1024)	    NULL,
    [SourceLastQueryObjectCount]				    INT				    NOT NULL    DEFAULT ((0)),
    CONSTRAINT [PK_Source] PRIMARY KEY CLUSTERED ([SourceID] ASC),
    CONSTRAINT [FK_Source_SourceType] FOREIGN KEY (SourceTypeID) REFERENCES [dbo].[SourceType](SourceTypeID)
);
GO

CREATE UNIQUE NONCLUSTERED INDEX [IDX_Source_SourceDescription] on [dbo].[Source]([SourceDescription]);
GO

CREATE NONCLUSTERED INDEX [IDX_Source_SourceLastQueryRun] ON [dbo].[Source]([SourceLastQueryRun] DESC);
GO

CREATE NONCLUSTERED INDEX [IDX_Source_SourceIsActive] ON [dbo].[Source]([SourceIsActive] DESC);
GO

INSERT INTO Source(SourceIsActive, SourceDescription, SourceTypeID, SourceQueryIntervalMinutes) VALUES (1, 'CORE', (SELECT SourceTypeID FROM SourceType WHERE SourceTypeLabel='CORE'), 60);
GO