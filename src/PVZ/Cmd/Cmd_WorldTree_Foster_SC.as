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
   
   public final class Cmd_WorldTree_Foster_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_WorldTree_Foster_SC";
      
      public static const FOSTERTYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_WorldTree_Foster_SC.fosterType","fosterType",1 << 3 | WireType.VARINT);
      
      public static const ISCRIT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_WorldTree_Foster_SC.isCrit","isCrit",2 << 3 | WireType.VARINT);
      
      public static const ADDEXP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_WorldTree_Foster_SC.addExp","addExp",3 << 3 | WireType.VARINT);
      
      public static const INFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_WorldTree_Foster_SC.info","info",4 << 3 | WireType.LENGTH_DELIMITED,Dto_WorldTree_Info);
       
      
      private var fosterType$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var isCrit$field:uint;
      
      private var addExp$field:uint;
      
      private var info$field:Dto_WorldTree_Info;
      
      public function Cmd_WorldTree_Foster_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_WorldTree_Foster_SC.$MessageID;
      }
      
      public function clearFosterType() : void
      {
         this.hasField$0 &= 4294967294;
         this.fosterType$field = new uint();
      }
      
      public function get hasFosterType() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set fosterType(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.fosterType$field = param1;
      }
      
      public function get fosterType() : uint
      {
         return this.fosterType$field;
      }
      
      public function clearIsCrit() : void
      {
         this.hasField$0 &= 4294967293;
         this.isCrit$field = new uint();
      }
      
      public function get hasIsCrit() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set isCrit(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.isCrit$field = param1;
      }
      
      public function get isCrit() : uint
      {
         return this.isCrit$field;
      }
      
      public function clearAddExp() : void
      {
         this.hasField$0 &= 4294967291;
         this.addExp$field = new uint();
      }
      
      public function get hasAddExp() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set addExp(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.addExp$field = param1;
      }
      
      public function get addExp() : uint
      {
         return this.addExp$field;
      }
      
      public function clearInfo() : void
      {
         this.info$field = null;
      }
      
      public function get hasInfo() : Boolean
      {
         return this.info$field != null;
      }
      
      public function set info(param1:Dto_WorldTree_Info) : void
      {
         this.info$field = param1;
      }
      
      public function get info() : Dto_WorldTree_Info
      {
         return this.info$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasFosterType)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.fosterType$field);
         }
         if(this.hasIsCrit)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.isCrit$field);
         }
         if(this.hasAddExp)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.addExp$field);
         }
         if(this.hasInfo)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write$TYPE_MESSAGE(param1,this.info$field);
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
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_WorldTree_Foster_SC.fosterType cannot be set twice.");
                  }
                  _loc3_++;
                  this.fosterType = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_WorldTree_Foster_SC.isCrit cannot be set twice.");
                  }
                  _loc4_++;
                  this.isCrit = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_WorldTree_Foster_SC.addExp cannot be set twice.");
                  }
                  _loc5_++;
                  this.addExp = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_WorldTree_Foster_SC.info cannot be set twice.");
                  }
                  _loc6_++;
                  this.info = new Dto_WorldTree_Info();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.info);
                  break;
               default:
                  super.readUnknown(param1,_loc7_);
                  break;
            }
         }
      }
   }
}
