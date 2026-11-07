; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-alsa-lib-baseline-r1/functions/alsa-lib/variants/c/0_alaw_to_s16_1.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-alsa-lib-baseline-r1/functions/alsa-lib/variants/c/0_alaw_to_s16_1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @alaw_to_s16(i8 noundef zeroext 97)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @alaw_to_s16(i8 noundef zeroext %a_val) #0 {
entry:
  %a_val.addr = alloca i8, align 1
  %mantissa = alloca i32, align 4
  %segment = alloca i32, align 4
  %magnitude = alloca i32, align 4
  store i8 %a_val, ptr %a_val.addr, align 1
  %0 = load i8, ptr %a_val.addr, align 1
  %conv = zext i8 %0 to i32
  %xor = xor i32 %conv, 5
  %and = and i32 %xor, 15
  store i32 %and, ptr %mantissa, align 4
  %1 = load i8, ptr %a_val.addr, align 1
  %conv1 = zext i8 %1 to i32
  %shr = ashr i32 %conv1, 4
  %xor2 = xor i32 %shr, 5
  %and3 = and i32 %xor2, 7
  store i32 %and3, ptr %segment, align 4
  %2 = load i32, ptr %segment, align 4
  %tobool = icmp ne i32 %2, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %3 = load i32, ptr %mantissa, align 4
  %mul = mul nsw i32 2, %3
  %add = add nsw i32 %mul, 33
  %4 = load i32, ptr %segment, align 4
  %add4 = add nsw i32 %4, 2
  %shl = shl i32 %add, %add4
  br label %cond.end

cond.false:                                       ; preds = %entry
  %5 = load i32, ptr %mantissa, align 4
  %mul5 = mul nsw i32 2, %5
  %add6 = add nsw i32 %mul5, 1
  %mul7 = mul nsw i32 %add6, 8
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %shl, %cond.true ], [ %mul7, %cond.false ]
  store i32 %cond, ptr %magnitude, align 4
  %6 = load i8, ptr %a_val.addr, align 1
  %conv8 = zext i8 %6 to i32
  %and9 = and i32 %conv8, 128
  %tobool10 = icmp ne i32 %and9, 0
  br i1 %tobool10, label %cond.true11, label %cond.false12

cond.true11:                                      ; preds = %cond.end
  %7 = load i32, ptr %magnitude, align 4
  br label %cond.end13

cond.false12:                                     ; preds = %cond.end
  %8 = load i32, ptr %magnitude, align 4
  %sub = sub nsw i32 0, %8
  br label %cond.end13

cond.end13:                                       ; preds = %cond.false12, %cond.true11
  %cond14 = phi i32 [ %7, %cond.true11 ], [ %sub, %cond.false12 ]
  ret i32 %cond14
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
