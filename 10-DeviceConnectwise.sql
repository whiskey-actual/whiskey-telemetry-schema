CREATE TABLE [dbo].[DeviceConnectwise] (
    [DeviceConnectwiseID]       			UNIQUEIDENTIFIER    NOT NULL    DEFAULT NEWSEQUENTIALID(),
    [ConnectwiseId]                         VARCHAR(255)        NOT NULL,
    [ConnectwiseDeviceType]                 VARCHAR(255), 
    [ConnectwiseLocation]                   VARCHAR(255), 
    [ConnectwiseClient]                     VARCHAR(255), 
    [ConnectwiseOperatingSystem]            VARCHAR(255), 
    [ConnectwiseOperatingSystemVersion]     VARCHAR(255), 
    [ConnectwiseDomainName]                 VARCHAR(255), 
    [ConnectwiseAgentVersion]               VARCHAR(255), 
    [ConnectwiseComment]                    VARCHAR(255), 
    [ConnectwiseIpAddress]                  VARCHAR(255), 
    [ConnectwiseMacAddress]                 VARCHAR(255),
    [ConnectwiseLastUserName]               VARCHAR(255), 
    [ConnectwiseType]                       VARCHAR(255), 
    [ConnectwiseStatus]                     VARCHAR(255), 
    [ConnectwiseSerialNumber]               VARCHAR(255), 
    [ConnectwiseBiosManufacturer]           VARCHAR(255), 
    [ConnectwiseModel]                      VARCHAR(255), 
    [ConnectwiseDescription]                VARCHAR(255), 
    -- numbers  
    [ConnectwiseTotalMemory]                VARCHAR(255), 
    [ConnectwiseFreeMemory]                 VARCHAR(255), 
    -- dates 
    [ConnectwiseLastObserved]               DATETIME2, 
    [ConnectwiseFirstSeen]                  DATETIME2, 
    [ConnectwiseWindowsUpdateDate]          DATETIME2           NULL,
    [ConnectwiseAntivirusDefinitionDate]    DATETIME2           NULL,
 
    CONSTRAINT [PK_DeviceConnectwiseID] PRIMARY KEY CLUSTERED ([DeviceConnectwiseID] ASC),
)
GO

CREATE NONCLUSTERED INDEX IDX_DeviceConnectwise_ConnectwiseId ON [dbo].[DeviceConnectwise]([ConnectwiseId])
GO

CREATE PROCEDURE dbo.sp_add_connectwise_device 
    @deviceName                             VARCHAR(255),
    @ConnectwiseId                          VARCHAR(255), 
    @ConnectwiseDeviceType                  VARCHAR(255),
    @ConnectwiseLocation                    VARCHAR(255), 
    @ConnectwiseClient                      VARCHAR(255), 
    @ConnectwiseOperatingSystem             VARCHAR(255), 
    @ConnectwiseOperatingSystemVersion      VARCHAR(255), 
    @ConnectwiseDomainName                  VARCHAR(255), 
    @ConnectwiseAgentVersion                VARCHAR(255), 
    @ConnectwiseComment                     VARCHAR(255), 
    @ConnectwiseIpAddress                   VARCHAR(255), 
    @ConnectwiseMacAddress                  VARCHAR(255), 
    @ConnectwiseLastUserName                VARCHAR(255), 
    @ConnectwiseType                        VARCHAR(255), 
    @ConnectwiseStatus                      VARCHAR(255), 
    @ConnectwiseSerialNumber                VARCHAR(255), 
    @ConnectwiseBiosManufacturer            VARCHAR(255), 
    @ConnectwiseModel                       VARCHAR(255), 
    @ConnectwiseDescription                 VARCHAR(255), 
    -- numbers  
    @ConnectwiseTotalMemory                 VARCHAR(255), 
    @ConnectwiseFreeMemory                  VARCHAR(255), 
    -- dates 
    @ConnectwiseLastObserved                DATETIME2, 
    @ConnectwiseFirstSeen                   DATETIME2, 
    @ConnectwiseWindowsUpdateDate           DATETIME2,
    @ConnectwiseAntivirusDefinitionDate     DATETIME2
AS
BEGIN

    DECLARE @DeviceID UNIQUEIDENTIFIER
    SELECT @DeviceID=DeviceID FROM Device WHERE DeviceName=@deviceName
    IF @DeviceID IS NULL
    BEGIN
        INSERT INTO Device(DeviceName, DeviceObservedByConnectwise) VALUES (@DeviceName, 1)
        SELECT @DeviceID=DeviceID FROM Device WHERE DeviceName=@deviceName
    END

    DECLARE @DeviceConnectwiseID UNIQUEIDENTIFIER
    SELECT @DeviceConnectwiseID=DeviceConnectwiseID FROM Device WHERE DeviceID=@DeviceID

    IF @DeviceConnectwiseID IS NULL
    BEGIN
        INSERT INTO
            DeviceConnectwise (
                ConnectwiseId,  
                ConnectwiseDeviceType, 
                ConnectwiseLocation,  
                ConnectwiseClient,  
                ConnectwiseOperatingSystem,  
                ConnectwiseOperatingSystemVersion,  
                ConnectwiseDomainName,  
                ConnectwiseAgentVersion,  
                ConnectwiseComment,  
                ConnectwiseIpAddress,  
                ConnectwiseMacAddress,  
                ConnectwiseLastUserName,  
                ConnectwiseType,  
                ConnectwiseStatus,  
                ConnectwiseSerialNumber,  
                ConnectwiseBiosManufacturer,  
                ConnectwiseModel,  
                ConnectwiseDescription,  
                ConnectwiseTotalMemory,  
                ConnectwiseFreeMemory,  
                ConnectwiseLastObserved,
                ConnectwiseFirstSeen,
                ConnectwiseWindowsUpdateDate,
                ConnectwiseAntivirusDefinitionDate
            ) VALUES (
                @ConnectwiseId,  
                @ConnectwiseDeviceType, 
                @ConnectwiseLocation,  
                @ConnectwiseClient,  
                @ConnectwiseOperatingSystem,  
                @ConnectwiseOperatingSystemVersion,  
                @ConnectwiseDomainName,  
                @ConnectwiseAgentVersion,  
                @ConnectwiseComment,  
                @ConnectwiseIpAddress,  
                @ConnectwiseMacAddress,  
                @ConnectwiseLastUserName,  
                @ConnectwiseType,  
                @ConnectwiseStatus,  
                @ConnectwiseSerialNumber,  
                @ConnectwiseBiosManufacturer,  
                @ConnectwiseModel,  
                @ConnectwiseDescription,  
                @ConnectwiseTotalMemory,  
                @ConnectwiseFreeMemory,  
                @ConnectwiseLastObserved,
                @ConnectwiseFirstSeen,
                @ConnectwiseWindowsUpdateDate,
                @ConnectwiseAntivirusDefinitionDate
            )

            SELECT @DeviceConnectwiseID=DeviceConnectwiseID FROM DeviceConnectwise WHERE ConnectwiseId=@ConnectwiseId

            UPDATE Device SET DeviceObservedByConnectwise=1, DeviceConnectwiseID=@DeviceConnectwiseID WHERE DeviceID=@DeviceID

    END
    ELSE
    BEGIN

        UPDATE
            DeviceConnectwise
        SET
            ConnectwiseId=@ConnectwiseId,   
            ConnectwiseDeviceType=@ConnectwiseDeviceType,  
            ConnectwiseLocation=@ConnectwiseLocation,   
            ConnectwiseClient=@ConnectwiseClient,   
            ConnectwiseOperatingSystem=@ConnectwiseOperatingSystem,   
            ConnectwiseOperatingSystemVersion=@ConnectwiseOperatingSystemVersion,   
            ConnectwiseDomainName=@ConnectwiseDomainName,   
            ConnectwiseAgentVersion=@ConnectwiseAgentVersion,   
            ConnectwiseComment=@ConnectwiseComment,   
            ConnectwiseIpAddress=@ConnectwiseIpAddress,   
            ConnectwiseMacAddress=@ConnectwiseMacAddress,   
            ConnectwiseLastUserName=@ConnectwiseLastUserName,   
            ConnectwiseType=@ConnectwiseType,   
            ConnectwiseStatus=@ConnectwiseStatus,   
            ConnectwiseSerialNumber=@ConnectwiseSerialNumber,   
            ConnectwiseBiosManufacturer=@ConnectwiseBiosManufacturer,   
            ConnectwiseModel=@ConnectwiseModel,   
            ConnectwiseDescription=@ConnectwiseDescription,   
            ConnectwiseTotalMemory=@ConnectwiseTotalMemory,   
            ConnectwiseFreeMemory=@ConnectwiseFreeMemory,   
            ConnectwiseLastObserved=@ConnectwiseLastObserved, 
            ConnectwiseFirstSeen=@ConnectwiseFirstSeen, 
            ConnectwiseWindowsUpdateDate=@ConnectwiseWindowsUpdateDate, 
            ConnectwiseAntivirusDefinitionDate=@ConnectwiseAntivirusDefinitionDate
        WHERE
            DeviceConnectwiseID=@DeviceConnectwiseID
    END



END

