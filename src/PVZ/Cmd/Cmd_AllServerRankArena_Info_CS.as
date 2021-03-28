package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_AllServerRankArena_Info_CS extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_AllServerRankArena_Info_CS";
      
      public static const NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Cmd_AllServerRankArena_Info_CS.name","name",101 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const UIN:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_AllServerRankArena_Info_CS.uin","uin",102 << 3 | WireType.VARINT);
      
      public static const LEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_AllServerRankArena_Info_CS.level","level",103 << 3 | WireType.VARINT);
      
      public static const QQFACEURL:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Cmd_AllServerRankArena_Info_CS.qqFaceURL","qqFaceURL",104 << 3 | WireType.LENGTH_DELIMITED);
       
      
      private var name$field:String;
      
      private var uin$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var level$field:uint;
      
      private var qqFaceURL$field:String;
      
      public function Cmd_AllServerRankArena_Info_CS()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_AllServerRankArena_Info_CS.$MessageID;
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
      
      public function clearUin() : void
      {
         this.hasField$0 &= 4294967294;
         this.uin$field = new uint();
      }
      
      public function get hasUin() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set uin(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.uin$field = param1;
      }
      
      public function get uin() : uint
      {
         return this.uin$field;
      }
      
      public function clearLevel() : void
      {
         this.hasField$0 &= 4294967293;
         this.level$field = new uint();
      }
      
      public function get hasLevel() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set level(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.level$field = param1;
      }
      
      public function get level() : uint
      {
         return this.level$field;
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
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasName)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,101);
            WriteUtils.write$TYPE_STRING(param1,this.name$field);
         }
         if(this.hasUin)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,102);
            WriteUtils.write$TYPE_UINT32(param1,this.uin$field);
         }
         if(this.hasLevel)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,103);
            WriteUtils.write$TYPE_UINT32(param1,this.level$field);
         }
         if(this.hasQqFaceURL)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,104);
            WriteUtils.write$TYPE_STRING(param1,this.qqFaceURL$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc7_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc7_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc7_ >> 3)
            {
               case 101:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_AllServerRankArena_Info_CS.name cannot be set twice.");
                  }
                  _loc3_++;
                  this.name = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 102:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_AllServerRankArena_Info_CS.uin cannot be set twice.");
                  }
                  _loc4_++;
                  this.uin = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 103:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_AllServerRankArena_Info_CS.level cannot be set twice.");
                  }
                  _loc5_++;
                  this.level = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 104:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_AllServerRankArena_Info_CS.qqFaceURL cannot be set twice.");
                  }
                  _loc6_++;
                  this.qqFaceURL = ReadUtils.read$TYPE_STRING(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc7_);
                  break;
            }
         }
      }
   }
}
