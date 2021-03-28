package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT32;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Init_CS extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Init_CS";
      
      public static const PF:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Cmd_Init_CS.pf","pf",1 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const OPENID:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Cmd_Init_CS.openid","openid",2 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const OPENKEY:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Cmd_Init_CS.openkey","openkey",3 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const PFKEY:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Cmd_Init_CS.pfKey","pfKey",4 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const INVITEPARAM:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Cmd_Init_CS.inviteParam","inviteParam",5 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const CHANNEL:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Cmd_Init_CS.channel","channel",6 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const WDPID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("PVZ.Cmd.Cmd_Init_CS.wdpid","wdpid",7 << 3 | WireType.VARINT);
      
      public static const ADTAG:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Cmd_Init_CS.adtag","adtag",8 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const NEEDACTIVE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("PVZ.Cmd.Cmd_Init_CS.needActive","needActive",9 << 3 | WireType.VARINT);
      
      public static const ROLENAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Cmd_Init_CS.roleName","roleName",10 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const SEX:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Init_CS.sex","sex",11 << 3 | WireType.VARINT);
      
      public static const APPUSERSOURCE:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Cmd_Init_CS.appusersource","appusersource",12 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const APPCONTRACTID:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Cmd_Init_CS.appcontractid","appcontractid",13 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const APPCUSTOM:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Cmd_Init_CS.appcustom","appcustom",14 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const REALPF:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Cmd_Init_CS.realpf","realpf",15 << 3 | WireType.LENGTH_DELIMITED);
       
      
      private var pf$field:String;
      
      private var openid$field:String;
      
      private var openkey$field:String;
      
      private var pfKey$field:String;
      
      private var inviteParam$field:String;
      
      private var channel$field:String;
      
      private var wdpid$field:int;
      
      private var hasField$0:uint = 0;
      
      private var adtag$field:String;
      
      private var needActive$field:int;
      
      private var roleName$field:String;
      
      private var sex$field:uint;
      
      private var appusersource$field:String;
      
      private var appcontractid$field:String;
      
      private var appcustom$field:String;
      
      private var realpf$field:String;
      
      public function Cmd_Init_CS()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Init_CS.$MessageID;
      }
      
      public function clearPf() : void
      {
         this.pf$field = null;
      }
      
      public function get hasPf() : Boolean
      {
         return this.pf$field != null;
      }
      
      public function set pf(param1:String) : void
      {
         this.pf$field = param1;
      }
      
      public function get pf() : String
      {
         return this.pf$field;
      }
      
      public function clearOpenid() : void
      {
         this.openid$field = null;
      }
      
      public function get hasOpenid() : Boolean
      {
         return this.openid$field != null;
      }
      
      public function set openid(param1:String) : void
      {
         this.openid$field = param1;
      }
      
      public function get openid() : String
      {
         return this.openid$field;
      }
      
      public function clearOpenkey() : void
      {
         this.openkey$field = null;
      }
      
      public function get hasOpenkey() : Boolean
      {
         return this.openkey$field != null;
      }
      
      public function set openkey(param1:String) : void
      {
         this.openkey$field = param1;
      }
      
      public function get openkey() : String
      {
         return this.openkey$field;
      }
      
      public function clearPfKey() : void
      {
         this.pfKey$field = null;
      }
      
      public function get hasPfKey() : Boolean
      {
         return this.pfKey$field != null;
      }
      
      public function set pfKey(param1:String) : void
      {
         this.pfKey$field = param1;
      }
      
      public function get pfKey() : String
      {
         return this.pfKey$field;
      }
      
      public function clearInviteParam() : void
      {
         this.inviteParam$field = null;
      }
      
      public function get hasInviteParam() : Boolean
      {
         return this.inviteParam$field != null;
      }
      
      public function set inviteParam(param1:String) : void
      {
         this.inviteParam$field = param1;
      }
      
      public function get inviteParam() : String
      {
         return this.inviteParam$field;
      }
      
      public function clearChannel() : void
      {
         this.channel$field = null;
      }
      
      public function get hasChannel() : Boolean
      {
         return this.channel$field != null;
      }
      
      public function set channel(param1:String) : void
      {
         this.channel$field = param1;
      }
      
      public function get channel() : String
      {
         return this.channel$field;
      }
      
      public function clearWdpid() : void
      {
         this.hasField$0 &= 4294967294;
         this.wdpid$field = new int();
      }
      
      public function get hasWdpid() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set wdpid(param1:int) : void
      {
         this.hasField$0 |= 1;
         this.wdpid$field = param1;
      }
      
      public function get wdpid() : int
      {
         return this.wdpid$field;
      }
      
      public function clearAdtag() : void
      {
         this.adtag$field = null;
      }
      
      public function get hasAdtag() : Boolean
      {
         return this.adtag$field != null;
      }
      
      public function set adtag(param1:String) : void
      {
         this.adtag$field = param1;
      }
      
      public function get adtag() : String
      {
         return this.adtag$field;
      }
      
      public function clearNeedActive() : void
      {
         this.hasField$0 &= 4294967293;
         this.needActive$field = new int();
      }
      
      public function get hasNeedActive() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set needActive(param1:int) : void
      {
         this.hasField$0 |= 2;
         this.needActive$field = param1;
      }
      
      public function get needActive() : int
      {
         return this.needActive$field;
      }
      
      public function clearRoleName() : void
      {
         this.roleName$field = null;
      }
      
      public function get hasRoleName() : Boolean
      {
         return this.roleName$field != null;
      }
      
      public function set roleName(param1:String) : void
      {
         this.roleName$field = param1;
      }
      
      public function get roleName() : String
      {
         return this.roleName$field;
      }
      
      public function clearSex() : void
      {
         this.hasField$0 &= 4294967291;
         this.sex$field = new uint();
      }
      
      public function get hasSex() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set sex(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.sex$field = param1;
      }
      
      public function get sex() : uint
      {
         return this.sex$field;
      }
      
      public function clearAppusersource() : void
      {
         this.appusersource$field = null;
      }
      
      public function get hasAppusersource() : Boolean
      {
         return this.appusersource$field != null;
      }
      
      public function set appusersource(param1:String) : void
      {
         this.appusersource$field = param1;
      }
      
      public function get appusersource() : String
      {
         return this.appusersource$field;
      }
      
      public function clearAppcontractid() : void
      {
         this.appcontractid$field = null;
      }
      
      public function get hasAppcontractid() : Boolean
      {
         return this.appcontractid$field != null;
      }
      
      public function set appcontractid(param1:String) : void
      {
         this.appcontractid$field = param1;
      }
      
      public function get appcontractid() : String
      {
         return this.appcontractid$field;
      }
      
      public function clearAppcustom() : void
      {
         this.appcustom$field = null;
      }
      
      public function get hasAppcustom() : Boolean
      {
         return this.appcustom$field != null;
      }
      
      public function set appcustom(param1:String) : void
      {
         this.appcustom$field = param1;
      }
      
      public function get appcustom() : String
      {
         return this.appcustom$field;
      }
      
      public function clearRealpf() : void
      {
         this.realpf$field = null;
      }
      
      public function get hasRealpf() : Boolean
      {
         return this.realpf$field != null;
      }
      
      public function set realpf(param1:String) : void
      {
         this.realpf$field = param1;
      }
      
      public function get realpf() : String
      {
         return this.realpf$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasPf)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_STRING(param1,this.pf$field);
         }
         if(this.hasOpenid)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_STRING(param1,this.openid$field);
         }
         if(this.hasOpenkey)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_STRING(param1,this.openkey$field);
         }
         if(this.hasPfKey)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write$TYPE_STRING(param1,this.pfKey$field);
         }
         if(this.hasInviteParam)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,5);
            WriteUtils.write$TYPE_STRING(param1,this.inviteParam$field);
         }
         if(this.hasChannel)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,6);
            WriteUtils.write$TYPE_STRING(param1,this.channel$field);
         }
         if(this.hasWdpid)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_INT32(param1,this.wdpid$field);
         }
         if(this.hasAdtag)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,8);
            WriteUtils.write$TYPE_STRING(param1,this.adtag$field);
         }
         if(this.hasNeedActive)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,9);
            WriteUtils.write$TYPE_INT32(param1,this.needActive$field);
         }
         if(this.hasRoleName)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,10);
            WriteUtils.write$TYPE_STRING(param1,this.roleName$field);
         }
         if(this.hasSex)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,11);
            WriteUtils.write$TYPE_UINT32(param1,this.sex$field);
         }
         if(this.hasAppusersource)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,12);
            WriteUtils.write$TYPE_STRING(param1,this.appusersource$field);
         }
         if(this.hasAppcontractid)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,13);
            WriteUtils.write$TYPE_STRING(param1,this.appcontractid$field);
         }
         if(this.hasAppcustom)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,14);
            WriteUtils.write$TYPE_STRING(param1,this.appcustom$field);
         }
         if(this.hasRealpf)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,15);
            WriteUtils.write$TYPE_STRING(param1,this.realpf$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc18_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         var _loc9_:uint = 0;
         var _loc10_:uint = 0;
         var _loc11_:uint = 0;
         var _loc12_:uint = 0;
         var _loc13_:uint = 0;
         var _loc14_:uint = 0;
         var _loc15_:uint = 0;
         var _loc16_:uint = 0;
         var _loc17_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc18_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc18_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Init_CS.pf cannot be set twice.");
                  }
                  _loc3_++;
                  this.pf = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Init_CS.openid cannot be set twice.");
                  }
                  _loc4_++;
                  this.openid = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Init_CS.openkey cannot be set twice.");
                  }
                  _loc5_++;
                  this.openkey = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Init_CS.pfKey cannot be set twice.");
                  }
                  _loc6_++;
                  this.pfKey = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Init_CS.inviteParam cannot be set twice.");
                  }
                  _loc7_++;
                  this.inviteParam = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Init_CS.channel cannot be set twice.");
                  }
                  _loc8_++;
                  this.channel = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Init_CS.wdpid cannot be set twice.");
                  }
                  _loc9_++;
                  this.wdpid = ReadUtils.read$TYPE_INT32(param1);
                  break;
               case 8:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Init_CS.adtag cannot be set twice.");
                  }
                  _loc10_++;
                  this.adtag = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 9:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Init_CS.needActive cannot be set twice.");
                  }
                  _loc11_++;
                  this.needActive = ReadUtils.read$TYPE_INT32(param1);
                  break;
               case 10:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Init_CS.roleName cannot be set twice.");
                  }
                  _loc12_++;
                  this.roleName = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 11:
                  if(_loc13_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Init_CS.sex cannot be set twice.");
                  }
                  _loc13_++;
                  this.sex = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 12:
                  if(_loc14_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Init_CS.appusersource cannot be set twice.");
                  }
                  _loc14_++;
                  this.appusersource = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 13:
                  if(_loc15_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Init_CS.appcontractid cannot be set twice.");
                  }
                  _loc15_++;
                  this.appcontractid = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 14:
                  if(_loc16_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Init_CS.appcustom cannot be set twice.");
                  }
                  _loc16_++;
                  this.appcustom = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 15:
                  if(_loc17_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Init_CS.realpf cannot be set twice.");
                  }
                  _loc17_++;
                  this.realpf = ReadUtils.read$TYPE_STRING(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc18_);
                  break;
            }
         }
      }
   }
}
