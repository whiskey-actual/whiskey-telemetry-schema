CREATE TABLE [dbo].[SourceType] (
    [SourceTypeID]									UNIQUEIDENTIFIER    NOT NULL    DEFAULT NEWSEQUENTIALID(),
    [SourceTypeLabel]                               VARCHAR(16)         NOT NULL,
    CONSTRAINT [PK_SourceType] PRIMARY KEY CLUSTERED ([SourceTypeID] ASC),
);
GO

CREATE UNIQUE NONCLUSTERED INDEX [IDX_SourceType_SourceTypeLabel] ON [dbo].[SourceType]([SourceTypeLabel] DESC);
GO

INSERT INTO SourceType(SourceTypeLabel) VALUES ('CORE');
GO
