CREATE TABLE [dbo].[SourceRun] (
    [SourceRunID]           UNIQUEIDENTIFIER    NOT NULL    DEFAULT NEWSEQUENTIALID(),
    [SourceID]              UNIQUEIDENTIFIER    NOT NULL,
    [SourceRunStart]        DATETIME2           NOT NULL,
    [SourceRunEnd]          DATETIME2           NOT NULL,
    [SourceRunObjectCount]  INT				    NOT NULL    DEFAULT ((0)),
    CONSTRAINT [PK_SourceRun] PRIMARY KEY CLUSTERED ([SourceRunID] ASC),
    CONSTRAINT [FK_SourceRun_Source] FOREIGN KEY (SourceID) REFERENCES [dbo].[Source](SourceID)
);
GO

CREATE NONCLUSTERED INDEX [IDX_SourceRun_SourceID] ON [dbo].[SourceRun]([SourceID] ASC);
GO