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
   
   public final class Dto_WorldMap_MineCar extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_WorldMap_MineCar";
      
      public static const MINEPOS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_WorldMap_MineCar.minePos","minePos",1 << 3 | WireType.LENGTH_DELIMITED,Dto_WorldMap_Pos);
      
      public static const HARVERST:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_WorldMap_MineCar.harverst","harverst",2 << 3 | WireType.VARINT);
      
      public static const MAXHARVERST:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_WorldMap_MineCar.maxHarverst","maxHarverst",3 << 3 | WireType.VARINT);
       
      
      private var minePos$field:Dto_WorldMap_Pos;
      
      private var harverst$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var maxHarverst$field:uint;
      
      public function Dto_WorldMap_MineCar()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_WorldMap_MineCar.$MessageID;
      }
      
      public function clearMinePos() : void
      {
         this.minePos$field = null;
      }
      
      public function get hasMinePos() : Boolean
      {
         return this.minePos$field != null;
      }
      
      public function set minePos(param1:Dto_WorldMap_Pos) : void
      {
         this.minePos$field = param1;
      }
      
      public function get minePos() : Dto_WorldMap_Pos
      {
         return this.minePos$field;
      }
      
      public function clearHarverst() : void
      {
         this.hasField$0 &= 4294967294;
         this.harverst$field = new uint();
      }
      
      public function get hasHarverst() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set harverst(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.harverst$field = param1;
      }
      
      public function get harverst() : uint
      {
         return this.harverst$field;
      }
      
      public function clearMaxHarverst() : void
      {
         this.hasField$0 &= 4294967293;
         this.maxHarverst$field = new uint();
      }
      
      public function get hasMaxHarverst() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set maxHarverst(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.maxHarverst$field = param1;
      }
      
      public function get maxHarverst() : uint
      {
         return this.maxHarverst$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasMinePos)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.minePos$field);
         }
         if(this.hasHarverst)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.harverst$field);
         }
         if(this.hasMaxHarverst)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.maxHarverst$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc6_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc6_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc6_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_WorldMap_MineCar.minePos cannot be set twice.");
                  }
                  _loc3_++;
                  this.minePos = new Dto_WorldMap_Pos();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.minePos);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_WorldMap_MineCar.harverst cannot be set twice.");
                  }
                  _loc4_++;
                  this.harverst = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_WorldMap_MineCar.maxHarverst cannot be set twice.");
                  }
                  _loc5_++;
                  this.maxHarverst = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
