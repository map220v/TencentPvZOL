package PVZ.Cmd
{
   import com.tencent.protobuf.Int64;
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_ENUM;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT32;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT64;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_Chat extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_Chat";
      
      public static const CHANNEL:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("PVZ.Cmd.Dto_Chat.channel","channel",1 << 3 | WireType.VARINT,ChannelType);
      
      public static const TARGETID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_Chat.targetId","targetId",2 << 3 | WireType.VARINT);
      
      public static const TARGETNICK:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_Chat.targetNick","targetNick",3 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const ROLEID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_Chat.roleId","roleId",4 << 3 | WireType.VARINT);
      
      public static const ROLENICK:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_Chat.roleNick","roleNick",5 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const CONTENT:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_Chat.content","content",6 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const DIAMOND:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_Chat.diamond","diamond",7 << 3 | WireType.LENGTH_DELIMITED,Dto_DiamondInfo);
      
      public static const VIP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Chat.vip","vip",8 << 3 | WireType.VARINT);
      
      public static const I3366GROWLEVEL:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("PVZ.Cmd.Dto_Chat.i3366GrowLevel","i3366GrowLevel",9 << 3 | WireType.VARINT);
       
      
      private var channel$field:int;
      
      private var hasField$0:uint = 0;
      
      private var targetId$field:Int64;
      
      private var targetNick$field:String;
      
      private var roleId$field:Int64;
      
      private var roleNick$field:String;
      
      private var content$field:String;
      
      private var diamond$field:Dto_DiamondInfo;
      
      private var vip$field:uint;
      
      private var i3366GrowLevel$field:int;
      
      public function Dto_Chat()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_Chat.$MessageID;
      }
      
      public function clearChannel() : void
      {
         this.hasField$0 &= 4294967294;
         this.channel$field = new int();
      }
      
      public function get hasChannel() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set channel(param1:int) : void
      {
         this.hasField$0 |= 1;
         this.channel$field = param1;
      }
      
      public function get channel() : int
      {
         return this.channel$field;
      }
      
      public function clearTargetId() : void
      {
         this.targetId$field = null;
      }
      
      public function get hasTargetId() : Boolean
      {
         return this.targetId$field != null;
      }
      
      public function set targetId(param1:Int64) : void
      {
         this.targetId$field = param1;
      }
      
      public function get targetId() : Int64
      {
         return this.targetId$field;
      }
      
      public function clearTargetNick() : void
      {
         this.targetNick$field = null;
      }
      
      public function get hasTargetNick() : Boolean
      {
         return this.targetNick$field != null;
      }
      
      public function set targetNick(param1:String) : void
      {
         this.targetNick$field = param1;
      }
      
      public function get targetNick() : String
      {
         return this.targetNick$field;
      }
      
      public function clearRoleId() : void
      {
         this.roleId$field = null;
      }
      
      public function get hasRoleId() : Boolean
      {
         return this.roleId$field != null;
      }
      
      public function set roleId(param1:Int64) : void
      {
         this.roleId$field = param1;
      }
      
      public function get roleId() : Int64
      {
         return this.roleId$field;
      }
      
      public function clearRoleNick() : void
      {
         this.roleNick$field = null;
      }
      
      public function get hasRoleNick() : Boolean
      {
         return this.roleNick$field != null;
      }
      
      public function set roleNick(param1:String) : void
      {
         this.roleNick$field = param1;
      }
      
      public function get roleNick() : String
      {
         return this.roleNick$field;
      }
      
      public function clearContent() : void
      {
         this.content$field = null;
      }
      
      public function get hasContent() : Boolean
      {
         return this.content$field != null;
      }
      
      public function set content(param1:String) : void
      {
         this.content$field = param1;
      }
      
      public function get content() : String
      {
         return this.content$field;
      }
      
      public function clearDiamond() : void
      {
         this.diamond$field = null;
      }
      
      public function get hasDiamond() : Boolean
      {
         return this.diamond$field != null;
      }
      
      public function set diamond(param1:Dto_DiamondInfo) : void
      {
         this.diamond$field = param1;
      }
      
      public function get diamond() : Dto_DiamondInfo
      {
         return this.diamond$field;
      }
      
      public function clearVip() : void
      {
         this.hasField$0 &= 4294967293;
         this.vip$field = new uint();
      }
      
      public function get hasVip() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set vip(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.vip$field = param1;
      }
      
      public function get vip() : uint
      {
         return this.vip$field;
      }
      
      public function clearI3366GrowLevel() : void
      {
         this.hasField$0 &= 4294967291;
         this.i3366GrowLevel$field = new int();
      }
      
      public function get hasI3366GrowLevel() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set i3366GrowLevel(param1:int) : void
      {
         this.hasField$0 |= 4;
         this.i3366GrowLevel$field = param1;
      }
      
      public function get i3366GrowLevel() : int
      {
         return this.i3366GrowLevel$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasChannel)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_ENUM(param1,this.channel$field);
         }
         if(this.hasTargetId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_INT64(param1,this.targetId$field);
         }
         if(this.hasTargetNick)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_STRING(param1,this.targetNick$field);
         }
         if(this.hasRoleId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_INT64(param1,this.roleId$field);
         }
         if(this.hasRoleNick)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,5);
            WriteUtils.write$TYPE_STRING(param1,this.roleNick$field);
         }
         if(this.hasContent)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,6);
            WriteUtils.write$TYPE_STRING(param1,this.content$field);
         }
         if(this.hasDiamond)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,7);
            WriteUtils.write$TYPE_MESSAGE(param1,this.diamond$field);
         }
         if(this.hasVip)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,8);
            WriteUtils.write$TYPE_UINT32(param1,this.vip$field);
         }
         if(this.hasI3366GrowLevel)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,9);
            WriteUtils.write$TYPE_INT32(param1,this.i3366GrowLevel$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc12_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         var _loc9_:uint = 0;
         var _loc10_:uint = 0;
         var _loc11_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc12_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc12_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Chat.channel cannot be set twice.");
                  }
                  _loc3_++;
                  this.channel = ReadUtils.read$TYPE_ENUM(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Chat.targetId cannot be set twice.");
                  }
                  _loc4_++;
                  this.targetId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Chat.targetNick cannot be set twice.");
                  }
                  _loc5_++;
                  this.targetNick = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Chat.roleId cannot be set twice.");
                  }
                  _loc6_++;
                  this.roleId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Chat.roleNick cannot be set twice.");
                  }
                  _loc7_++;
                  this.roleNick = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Chat.content cannot be set twice.");
                  }
                  _loc8_++;
                  this.content = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Chat.diamond cannot be set twice.");
                  }
                  _loc9_++;
                  this.diamond = new Dto_DiamondInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.diamond);
                  break;
               case 8:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Chat.vip cannot be set twice.");
                  }
                  _loc10_++;
                  this.vip = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 9:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Chat.i3366GrowLevel cannot be set twice.");
                  }
                  _loc11_++;
                  this.i3366GrowLevel = ReadUtils.read$TYPE_INT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc12_);
                  break;
            }
         }
      }
   }
}
