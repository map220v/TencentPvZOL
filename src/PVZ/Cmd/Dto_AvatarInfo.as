package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_AvatarInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_AvatarInfo";
      
      public static const AVATARID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_AvatarInfo.avatarId","avatarId",1 << 3 | WireType.VARINT);
      
      public static const AVATARSTATUS:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_AvatarInfo.avatarStatus","avatarStatus",2 << 3 | WireType.VARINT);
      
      public static const AVATARFORGELEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_AvatarInfo.avatarForgeLevel","avatarForgeLevel",3 << 3 | WireType.VARINT);
      
      public static const CURRFIGHTPOWER:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_AvatarInfo.currFightPower","currFightPower",4 << 3 | WireType.VARINT);
      
      public static const NEXTFIGHTPOWER:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_AvatarInfo.nextFightPower","nextFightPower",5 << 3 | WireType.VARINT);
      
      public static const CURRADDATTR:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_AvatarInfo.currAddAttr","currAddAttr",6 << 3 | WireType.LENGTH_DELIMITED,Dto_AvatarAllAttr);
      
      public static const NEXTADDATTR:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_AvatarInfo.nextAddAttr","nextAddAttr",7 << 3 | WireType.LENGTH_DELIMITED,Dto_AvatarAllAttr);
       
      
      private var avatarId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var avatarStatus$field:uint;
      
      private var avatarForgeLevel$field:uint;
      
      private var currFightPower$field:uint;
      
      private var nextFightPower$field:uint;
      
      private var currAddAttr$field:Dto_AvatarAllAttr;
      
      private var nextAddAttr$field:Dto_AvatarAllAttr;
      
      public function Dto_AvatarInfo()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_AvatarInfo.$MessageID;
      }
      
      public function clearAvatarId() : void
      {
         this.hasField$0 &= 4294967294;
         this.avatarId$field = new uint();
      }
      
      public function get hasAvatarId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set avatarId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.avatarId$field = param1;
      }
      
      public function get avatarId() : uint
      {
         return this.avatarId$field;
      }
      
      public function clearAvatarStatus() : void
      {
         this.hasField$0 &= 4294967293;
         this.avatarStatus$field = new uint();
      }
      
      public function get hasAvatarStatus() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set avatarStatus(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.avatarStatus$field = param1;
      }
      
      public function get avatarStatus() : uint
      {
         return this.avatarStatus$field;
      }
      
      public function clearAvatarForgeLevel() : void
      {
         this.hasField$0 &= 4294967291;
         this.avatarForgeLevel$field = new uint();
      }
      
      public function get hasAvatarForgeLevel() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set avatarForgeLevel(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.avatarForgeLevel$field = param1;
      }
      
      public function get avatarForgeLevel() : uint
      {
         return this.avatarForgeLevel$field;
      }
      
      public function clearCurrFightPower() : void
      {
         this.hasField$0 &= 4294967287;
         this.currFightPower$field = new uint();
      }
      
      public function get hasCurrFightPower() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set currFightPower(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.currFightPower$field = param1;
      }
      
      public function get currFightPower() : uint
      {
         return this.currFightPower$field;
      }
      
      public function clearNextFightPower() : void
      {
         this.hasField$0 &= 4294967279;
         this.nextFightPower$field = new uint();
      }
      
      public function get hasNextFightPower() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set nextFightPower(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.nextFightPower$field = param1;
      }
      
      public function get nextFightPower() : uint
      {
         return this.nextFightPower$field;
      }
      
      public function clearCurrAddAttr() : void
      {
         this.currAddAttr$field = null;
      }
      
      public function get hasCurrAddAttr() : Boolean
      {
         return this.currAddAttr$field != null;
      }
      
      public function set currAddAttr(param1:Dto_AvatarAllAttr) : void
      {
         this.currAddAttr$field = param1;
      }
      
      public function get currAddAttr() : Dto_AvatarAllAttr
      {
         return this.currAddAttr$field;
      }
      
      public function clearNextAddAttr() : void
      {
         this.nextAddAttr$field = null;
      }
      
      public function get hasNextAddAttr() : Boolean
      {
         return this.nextAddAttr$field != null;
      }
      
      public function set nextAddAttr(param1:Dto_AvatarAllAttr) : void
      {
         this.nextAddAttr$field = param1;
      }
      
      public function get nextAddAttr() : Dto_AvatarAllAttr
      {
         return this.nextAddAttr$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasAvatarId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.avatarId$field);
         }
         if(this.hasAvatarStatus)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.avatarStatus$field);
         }
         if(this.hasAvatarForgeLevel)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.avatarForgeLevel$field);
         }
         if(this.hasCurrFightPower)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.currFightPower$field);
         }
         if(this.hasNextFightPower)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.nextFightPower$field);
         }
         if(this.hasCurrAddAttr)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,6);
            WriteUtils.write$TYPE_MESSAGE(param1,this.currAddAttr$field);
         }
         if(this.hasNextAddAttr)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,7);
            WriteUtils.write$TYPE_MESSAGE(param1,this.nextAddAttr$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc10_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         var _loc9_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc10_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc10_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_AvatarInfo.avatarId cannot be set twice.");
                  }
                  _loc3_++;
                  this.avatarId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_AvatarInfo.avatarStatus cannot be set twice.");
                  }
                  _loc4_++;
                  this.avatarStatus = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_AvatarInfo.avatarForgeLevel cannot be set twice.");
                  }
                  _loc5_++;
                  this.avatarForgeLevel = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_AvatarInfo.currFightPower cannot be set twice.");
                  }
                  _loc6_++;
                  this.currFightPower = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_AvatarInfo.nextFightPower cannot be set twice.");
                  }
                  _loc7_++;
                  this.nextFightPower = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_AvatarInfo.currAddAttr cannot be set twice.");
                  }
                  _loc8_++;
                  this.currAddAttr = new Dto_AvatarAllAttr();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.currAddAttr);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_AvatarInfo.nextAddAttr cannot be set twice.");
                  }
                  _loc9_++;
                  this.nextAddAttr = new Dto_AvatarAllAttr();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.nextAddAttr);
                  break;
               default:
                  super.readUnknown(param1,_loc10_);
                  break;
            }
         }
      }
   }
}
