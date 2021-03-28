package
{
   import com.qq.net.Uin;
   import flash.display.LoaderInfo;
   import flash.system.Capabilities;
   
   public class ExternalVars
   {
      
      public static const SFROM_QQGAME:String = "qqgame";
      
      public static const SFROM_QZONE:String = "qzone";
      
      public static const SFROM_3366:String = "3366";
      
      public static const SFROM_WEBSITE:String = "website";
      
      public static const SFROM_IWAN:String = "10029";
      
      public static const SFROM_XINYUE:String = "xinyue";
      
      public static const URL_QQGAME:String = "http://gamevip.qq.com/?ADTAG=VIP.WEB.PVZOL";
      
      public static const URL_3366:String = "http://gamevip.qq.com/?ADTAG=VIP.WEB.3366PVZOL";
      
      private static var _params:Object;
      
      private static const RELEASE_PATH:String = "";
      
      private static const CONFIG_FILE_PATH:String = "init.xml";
      
      public static var CONFIG_PATH:String = RELEASE_PATH + CONFIG_FILE_PATH;
      
      public static var ASSET_PATH:String = RELEASE_PATH + "asset/";
      
      public static var SWF_PATH:String;
      
      public static var OPEN_ID:String = "";
      
      public static var OPEN_KEY:String = "";
      
      public static var PLATFORM_KEY:String = "";
      
      public static var LOGGING_INITED:Boolean = false;
      
      public static var UIN:Uin;
      
      public static var APP_ID:int = 1101214027;
      
      public static var SKEY:String = "";
      
      public static var APP_TYPE:int = 0;
      
      public static var CGI_PATH:String = "";
      
      public static var DOMAIN:String = "";
      
      public static var UID:String = "";
      
      public static var TGW_PATH:String = "";
      
      public static var SOCKET_PATH:String = "";
      
      public static var RECONNET_PORTS:Array;
      
      public static var ZONE_ID:String = "0";
      
      public static var SFrom:String = "";
      
      public static var PF:String = "";
      
      public static var PlatformFlag:String = "";
      
      public static var Channel:String = "0";
      
      public static var ADTAG:String = "";
      
      public static var INVITE_PARAM:String = "";
      
      public static var LOADER_URL:String = "";
      
      public static var IS_Encryption:Boolean = true;
      
      public static var Need_Active:int = 0;
      
      public static var IS_UNION:Boolean = false;
      
      public static var Is_MicroClient:Boolean = false;
      
      public static var banAcitivityViewID:Array;
      
      public static var APP_CUSTOM:String;
      
      public static var debug:String;
       
      
      public function ExternalVars()
      {
         super();
      }
      
      private static function prepareInviteParam(param1:Object) : void
      {
         switch(PlatformFlag)
         {
            case SFROM_QQGAME:
               INVITE_PARAM = !!param1.hasOwnProperty("hallParam") ? param1["hallParam"] : "";
               break;
            case SFROM_QZONE:
               INVITE_PARAM = !!param1.hasOwnProperty("zoneParam") ? param1["hallParam"] : "";
               break;
            default:
               INVITE_PARAM = "";
         }
      }
      
      public static function initialize(param1:LoaderInfo) : void
      {
         var _loc4_:* = undefined;
         var _loc5_:Object = null;
         var _loc6_:String = null;
         var _loc9_:int = 0;
         var _loc10_:String = null;
         var _loc11_:Array = null;
         var _loc12_:int = 0;
         var _loc13_:Array = null;
         var _loc14_:String = null;
         var _loc2_:String = Capabilities.playerType;
         var _loc3_:String = "";
         for each(_loc4_ in param1.parameters)
         {
            _loc3_ += _loc4_.toString();
         }
         ExternalVars.debug = _loc3_;
         _loc5_ = param1.parameters;
         _loc6_ = (_loc6_ = param1.loaderURL).substring(0,_loc6_.lastIndexOf("/"));
         LOADER_URL = _loc6_;
         if(_loc5_.hasOwnProperty("domain"))
         {
            DOMAIN = _loc5_["domain"];
            CONFIG_PATH = DOMAIN + "conf/" + CONFIG_FILE_PATH;
            CGI_PATH = _loc5_["cgiPath"];
            UIN = new Uin(uint(_loc5_["flatId"].replace(/^o0/,"")));
            SKEY = _loc5_["skey"];
            APP_TYPE = int(_loc5_["appType"]);
         }
         if(_loc5_.hasOwnProperty("uin"))
         {
            UIN = new Uin(uint(_loc5_["uin"].replace(/o/g,"")));
            UID = UIN.data.toString();
         }
         if(_loc5_.hasOwnProperty("isMC"))
         {
            _loc9_ = int(_loc5_["isMC"]);
            Is_MicroClient = _loc9_ == 1;
         }
         if(_loc5_.hasOwnProperty("banActViewID"))
         {
            if((_loc10_ = String(_loc5_["banActViewID"])).length > 0)
            {
               _loc11_ = _loc10_.split(":");
               _loc12_ = 0;
               while(_loc12_ < _loc11_.length > 0)
               {
                  if(banAcitivityViewID == null)
                  {
                     banAcitivityViewID = new Array();
                  }
                  banAcitivityViewID.push(int(_loc11_[_loc12_]));
                  _loc12_++;
               }
            }
         }
         if(_loc5_.hasOwnProperty("skey"))
         {
            SKEY = _loc5_["skey"];
         }
         if(_loc5_.hasOwnProperty("tgw"))
         {
            ExternalVars.TGW_PATH = _loc5_["tgw"];
         }
         if(_loc5_.hasOwnProperty("server"))
         {
            ExternalVars.SOCKET_PATH = _loc5_["server"];
         }
         if(_loc5_.hasOwnProperty("zoneID"))
         {
            ExternalVars.ZONE_ID = _loc5_["zoneID"];
         }
         if(_loc5_.hasOwnProperty("sFrom") && String(_loc5_["sFrom"]).length > 0)
         {
            ExternalVars.SFrom = _loc5_["sFrom"];
         }
         if(_loc5_.hasOwnProperty("app_custom") && String(_loc5_["app_custom"]).length > 0)
         {
            APP_CUSTOM = _loc5_["app_custom"];
         }
         if(SFrom == null || SFrom.length == 0)
         {
            SFrom = SFROM_QQGAME;
         }
         if(_loc5_.hasOwnProperty("pf") && String(_loc5_["pf"]).length > 0)
         {
            PF = _loc5_["pf"];
         }
         else
         {
            PF = SFrom;
         }
         if(ExternalVars.SFrom.indexOf("union") != -1)
         {
            if((_loc13_ = ExternalVars.SFrom.split("*")).length > 0)
            {
               if((_loc14_ = _loc13_[_loc13_.length - 1]).indexOf(SFROM_QQGAME) != -1)
               {
                  PlatformFlag = SFROM_QQGAME;
               }
               else if(_loc14_.indexOf(SFROM_3366) != -1)
               {
                  PlatformFlag = SFROM_3366;
               }
               else if(_loc14_.indexOf(SFROM_WEBSITE) != -1)
               {
                  PlatformFlag = SFROM_WEBSITE;
               }
               else if(_loc14_.indexOf(SFROM_QZONE) != -1)
               {
                  PlatformFlag = SFROM_QZONE;
               }
               else if(_loc14_.indexOf(SFROM_IWAN) != -1)
               {
                  PlatformFlag = SFROM_IWAN;
               }
               else if(_loc14_.indexOf(SFROM_XINYUE) != -1)
               {
                  PlatformFlag = SFROM_XINYUE;
               }
               else
               {
                  PlatformFlag = SFROM_QZONE;
               }
               IS_UNION = true;
            }
            else
            {
               PlatformFlag = SFrom;
            }
         }
         else
         {
            PlatformFlag = SFrom;
         }
         if(_loc5_.hasOwnProperty("channel"))
         {
            ExternalVars.Channel = _loc5_["channel"];
         }
         if(_loc5_.hasOwnProperty("ADTAG"))
         {
            ExternalVars.ADTAG = _loc5_["ADTAG"];
         }
         if(_loc5_.hasOwnProperty("openid"))
         {
            if(!isPlatform(SFROM_WEBSITE))
            {
               ExternalVars.OPEN_ID = _loc5_["openid"];
            }
         }
         if(_loc5_.hasOwnProperty("openkey"))
         {
            if(!isPlatform(SFROM_WEBSITE))
            {
               ExternalVars.OPEN_KEY = _loc5_["openkey"];
            }
         }
         if(_loc5_.hasOwnProperty("pfkey"))
         {
            ExternalVars.PLATFORM_KEY = _loc5_["pfkey"];
         }
         ExternalVars.IS_Encryption = true;
         if(_loc5_.hasOwnProperty("needactive"))
         {
            ExternalVars.Need_Active = int(_loc5_["needactive"]);
         }
         ExternalVars.RECONNET_PORTS = [];
         prepareInviteParam(_loc5_);
         if(ExternalVars.ZONE_ID.length > 0)
         {
            ExternalVars.SOCKET_PATH = "s" + ExternalVars.ZONE_ID + ".zone.pvz.qq.com:8001";
            ExternalVars.TGW_PATH = "s" + ExternalVars.ZONE_ID + ".zone.pvz.qq.com:8001";
         }
         ExternalVars.RECONNET_PORTS = [443,80,8001];
         var _loc7_:String;
         var _loc8_:int = (_loc7_ = (_loc7_ = param1.url).split("\\").join("/")).lastIndexOf("/");
         SWF_PATH = _loc7_.slice(0,_loc8_) + "/";
      }
      
      public static function isPlatform(param1:String) : Boolean
      {
         return PlatformFlag == param1;
      }
   }
}
