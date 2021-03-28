package PVZ.Cmd
{
   import com.tencent.protobuf.Int64;
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT64;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_ArenaTopPlayer extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_ArenaTopPlayer";
      
      public static const ROLEID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_ArenaTopPlayer.roleId","roleId",1 << 3 | WireType.VARINT);
      
      public static const FACEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ArenaTopPlayer.faceId","faceId",2 << 3 | WireType.VARINT);
      
      public static const NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_ArenaTopPlayer.name","name",3 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const QQFACEURL:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_ArenaTopPlayer.qqFaceURL","qqFaceURL",4 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const DIAMOND:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_ArenaTopPlayer.diamond","diamond",5 << 3 | WireType.LENGTH_DELIMITED,Dto_DiamondInfo);
       
      
      private var roleId$field:Int64;
      
      private var faceId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var name$field:String;
      
      private var qqFaceURL$field:String;
      
      private var diamond$field:Dto_DiamondInfo;
      
      public function Dto_ArenaTopPlayer()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_ArenaTopPlayer.$MessageID;
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
      
      public function clearFaceId() : void
      {
         this.hasField$0 &= 4294967294;
         this.faceId$field = new uint();
      }
      
      public function get hasFaceId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set faceId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.faceId$field = param1;
      }
      
      public function get faceId() : uint
      {
         return this.faceId$field;
      }
      
      public function clearName() : void
      {
         this.name$field = null;
      }
      
      public function get hasName() : Boolean
      {
         return this.name$field != null;
      }
      
      public function set name(param1:String) : void
      {
         this.name$field = param1;
      }
      
      public function get name() : String
      {
         return this.name$field;
      }
      
      public function clearQqFaceURL() : void
      {
         this.qqFaceURL$field = null;
      }
      
      public function get hasQqFaceURL() : Boolean
      {
         return this.qqFaceURL$field != null;
      }
      
      public function set qqFaceURL(param1:String) : void
      {
         this.qqFaceURL$field = param1;
      }
      
      public function get qqFaceURL() : String
      {
         return this.qqFaceURL$field;
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
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasRoleId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_INT64(param1,this.roleId$field);
         }
         if(this.hasFaceId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.faceId$field);
         }
         if(this.hasName)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_STRING(param1,this.name$field);
         }
         if(this.hasQqFaceURL)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write$TYPE_STRING(param1,this.qqFaceURL$field);
         }
         if(this.hasDiamond)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,5);
            WriteUtils.write$TYPE_MESSAGE(param1,this.diamond$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc8_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc8_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc8_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ArenaTopPlayer.roleId cannot be set twice.");
                  }
                  _loc3_++;
                  this.roleId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ArenaTopPlayer.faceId cannot be set twice.");
                  }
                  _loc4_++;
                  this.faceId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ArenaTopPlayer.name cannot be set twice.");
                  }
                  _loc5_++;
                  this.name = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ArenaTopPlayer.qqFaceURL cannot be set twice.");
                  }
                  _loc6_++;
                  this.qqFaceURL = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ArenaTopPlayer.diamond cannot be set twice.");
                  }
                  _loc7_++;
                  this.diamond = new Dto_DiamondInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.diamond);
                  break;
               default:
                  super.readUnknown(param1,_loc8_);
                  break;
            }
         }
      }
   }
}
