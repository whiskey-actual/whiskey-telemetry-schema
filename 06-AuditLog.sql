SET QUOTED_IDENTIFIER ON;

CREATE TABLE [dbo].[AuditLog] (
    [AuditLogID]                UNIQUEIDENTIFIER    NOT NULL DEFAULT NEWSEQUENTIALID(),
    [SourceRunID]               UNIQUEIDENTIFIER    NOT NULL,
    [ActivityID]                UNIQUEIDENTIFIER    NOT NULL,
    [AuditType]                 VARCHAR(255)        NOT NULL,
    [OldValue]                  VARCHAR(MAX)        NULL,
    [NewValue]                  VARCHAR(MAX)        NULL,
    [AuditTimestamp]            TIMESTAMP           NOT NULL,
    CONSTRAINT [PK_AuditLog] PRIMARY KEY NONCLUSTERED ([AuditLogID] ASC),
    CONSTRAINT [FK_AuditLog_SourceRun] FOREIGN KEY ([SourceRunID]) REFERENCES [dbo].[SourceRun] ([SourceRunID])
);
GO

CREATE NONCLUSTERED INDEX [IDX_AuditLog_AuditTimestamp] ON [dbo].[AuditLog]([AuditTimestamp] DESC);
GO