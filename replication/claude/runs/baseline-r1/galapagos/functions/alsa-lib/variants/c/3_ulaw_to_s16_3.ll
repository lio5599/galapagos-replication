; ModuleID = '/home/liolsen/galapagos-replication/functions/alsa-lib/variants/c/3_ulaw_to_s16_3.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/alsa-lib/variants/c/3_ulaw_to_s16_3.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@ulaw_to_s16.bias = internal constant [8 x i32] [i32 0, i32 132, i32 396, i32 924, i32 1980, i32 4092, i32 8316, i32 16764], align 16

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @ulaw_to_s16(i8 noundef zeroext 97)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @ulaw_to_s16(i8 noundef zeroext %u_val) #0 {
entry:
  %u_val.addr = alloca i8, align 1
  %u = alloca i32, align 4
  %exponent = alloca i32, align 4
  %mag = alloca i32, align 4
  store i8 %u_val, ptr %u_val.addr, align 1
  %0 = load i8, ptr %u_val.addr, align 1
  %conv = zext i8 %0 to i32
  %xor = xor i32 %conv, 255
  store i32 %xor, ptr %u, align 4
  %1 = load i32, ptr %u, align 4
  %shr = ashr i32 %1, 4
  %and = and i32 %shr, 7
  store i32 %and, ptr %exponent, align 4
  %2 = load i32, ptr %u, align 4
  %and1 = and i32 %2, 15
  %3 = load i32, ptr %exponent, align 4
  %add = add nsw i32 %3, 3
  %shl = shl i32 %and1, %add
  %4 = load i32, ptr %exponent, align 4
  %idxprom = sext i32 %4 to i64
  %arrayidx = getelementptr inbounds [8 x i32], ptr @ulaw_to_s16.bias, i64 0, i64 %idxprom
  %5 = load i32, ptr %arrayidx, align 4
  %add2 = add nsw i32 %shl, %5
  store i32 %add2, ptr %mag, align 4
  %6 = load i32, ptr %u, align 4
  %and3 = and i32 %6, 128
  %tobool = icmp ne i32 %and3, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %7 = load i32, ptr %mag, align 4
  %sub = sub nsw i32 0, %7
  br label %cond.end

cond.false:                                       ; preds = %entry
  %8 = load i32, ptr %mag, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %sub, %cond.true ], [ %8, %cond.false ]
  ret i32 %cond
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 17.0.0 (git@github.com:llvm/llvm-project.git 1a7a00bdc99fa2b2ca19ecd2d1069991b3c1006b)"}
