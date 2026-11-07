; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-alsa-lib-context-r2/functions/alsa-lib/variants/c/0_alaw_to_s16_8.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-alsa-lib-context-r2/functions/alsa-lib/variants/c/0_alaw_to_s16_8.c"
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
  %x = alloca i32, align 4
  %seg = alloca i32, align 4
  %shift = alloca i32, align 4
  %t = alloca i32, align 4
  %negative = alloca i32, align 4
  store i8 %a_val, ptr %a_val.addr, align 1
  %0 = load i8, ptr %a_val.addr, align 1
  %conv = zext i8 %0 to i32
  %xor = xor i32 %conv, 85
  store i32 %xor, ptr %x, align 4
  %1 = load i32, ptr %x, align 4
  %shr = ashr i32 %1, 4
  %and = and i32 %shr, 7
  store i32 %and, ptr %seg, align 4
  %2 = load i32, ptr %seg, align 4
  %cmp = icmp sgt i32 %2, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %3 = load i32, ptr %seg, align 4
  %sub = sub nsw i32 %3, 1
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %sub, %cond.true ], [ 0, %cond.false ]
  store i32 %cond, ptr %shift, align 4
  %4 = load i32, ptr %x, align 4
  %and2 = and i32 %4, 15
  %mul = mul nsw i32 %and2, 16
  %5 = load i32, ptr %seg, align 4
  %cmp3 = icmp sgt i32 %5, 0
  %6 = zext i1 %cmp3 to i64
  %cond5 = select i1 %cmp3, i32 264, i32 8
  %add = add nsw i32 %mul, %cond5
  %7 = load i32, ptr %shift, align 4
  %shl = shl i32 %add, %7
  store i32 %shl, ptr %t, align 4
  %8 = load i32, ptr %x, align 4
  %and6 = and i32 %8, 128
  %cmp7 = icmp eq i32 %and6, 0
  %conv8 = zext i1 %cmp7 to i32
  store i32 %conv8, ptr %negative, align 4
  %9 = load i32, ptr %t, align 4
  %10 = load i32, ptr %negative, align 4
  %mul9 = mul nsw i32 2, %10
  %11 = load i32, ptr %t, align 4
  %mul10 = mul nsw i32 %mul9, %11
  %sub11 = sub nsw i32 %9, %mul10
  ret i32 %sub11
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
