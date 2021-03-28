package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_CardGene extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_CardGene";
      
      public static const GENEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_CardGene.geneId","geneId",1 << 3 | WireType.VARINT);
      
      public static const FACTORLEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_CardGene.factorLevel","factorLevel",2 << 3 | WireType.VARINT);
      
      public static const FACTOREXP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_CardGene.factorExp","factorExp",3 << 3 | WireType.VARINT);
      
      public static const ATTRIBUTE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_CardGene.attribute","attribute",4 << 3 | WireType.VARINT);
      
      public static const LEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_CardGene.level","level",5 << 3 | WireType.VARINT);
       
      
      private var geneId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var factorLevel$field:uint;
      
      private var factorExp$field:uint;
      
      private var attribute$field:uint;
      
      private var level$field:uint;
      
      public function Dto_CardGene()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_CardGene.$MessageID;
      }
      
      public function clearGeneId() : void
      {
         this.hasField$0 &= 4294967294;
         this.geneId$field = new uint();
      }
      
      public function get hasGeneId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set geneId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.geneId$field = param1;
      }
      
      public function get geneId() : uint
      {
         return this.geneId$field;
      }
      
      public function clearFactorLevel() : void
      {
         this.hasField$0 &= 4294967293;
         this.factorLevel$field = new uint();
      }
      
      public function get hasFactorLevel() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set factorLevel(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.factorLevel$field = param1;
      }
      
      public function get factorLevel() : uint
      {
         return this.factorLevel$field;
      }
      
      public function clearFactorExp() : void
      {
         this.hasField$0 &= 4294967291;
         this.factorExp$field = new uint();
      }
      
      public function get hasFactorExp() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set factorExp(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.factorExp$field = param1;
      }
      
      public function get factorExp() : uint
      {
         return this.factorExp$field;
      }
      
      public function clearAttribute() : void
      {
         this.hasField$0 &= 4294967287;
         this.attribute$field = new uint();
      }
      
      public function get hasAttribute() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set attribute(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.attribute$field = param1;
      }
      
      public function get attribute() : uint
      {
         return this.attribute$field;
      }
      
      public function clearLevel() : void
      {
         this.hasField$0 &= 4294967279;
         this.level$field = new uint();
      }
      
      public function get hasLevel() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set level(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.level$field = param1;
      }
      
      public function get level() : uint
      {
         return this.level$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasGeneId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.geneId$field);
         }
         if(this.hasFactorLevel)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.factorLevel$field);
         }
         if(this.hasFactorExp)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.factorExp$field);
         }
         if(this.hasAttribute)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.attribute$field);
         }
         if(this.hasLevel)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.level$field);
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
                     throw new IOError("Bad data format: Dto_CardGene.geneId cannot be set twice.");
                  }
                  _loc3_++;
                  this.geneId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardGene.factorLevel cannot be set twice.");
                  }
                  _loc4_++;
                  this.factorLevel = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardGene.factorExp cannot be set twice.");
                  }
                  _loc5_++;
                  this.factorExp = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardGene.attribute cannot be set twice.");
                  }
                  _loc6_++;
                  this.attribute = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardGene.level cannot be set twice.");
                  }
                  _loc7_++;
                  this.level = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc8_);
                  break;
            }
         }
      }
   }
}
