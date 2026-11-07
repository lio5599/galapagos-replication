; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-alsa-lib-cot-r2/functions/alsa-lib/variants/c/0_alaw_to_s16_6.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-alsa-lib-cot-r2/functions/alsa-lib/variants/c/0_alaw_to_s16_6.c"
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
  %u = alloca i32, align 4
  %seg = alloca i32, align 4
  %scale = alloca i32, align 4
  %t = alloca i32, align 4
  store i8 %a_val, ptr %a_val.addr, align 1
  %0 = load i8, ptr %a_val.addr, align 1
  %conv = zext i8 %0 to i32
  %xor = xor i32 %conv, 85
  store i32 %xor, ptr %u, align 4
  %1 = load i32, ptr %u, align 4
  %shr = ashr i32 %1, 4
  %and = and i32 %shr, 7
  store i32 %and, ptr %seg, align 4
  %2 = load i32, ptr %seg, align 4
  %cmp = icmp eq i32 %2, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  br label %cond.end

cond.false:                                       ; preds = %entry
  %3 = load i32, ptr %seg, align 4
  %sub = sub nsw i32 %3, 1
  %shl = shl i32 1, %sub
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 1, %cond.true ], [ %shl, %cond.false ]
  store i32 %cond, ptr %scale, align 4
  %4 = load i32, ptr %seg, align 4
  %cmp2 = icmp eq i32 %4, 0
  %5 = zext i1 %cmp2 to i64
  %cond4 = select i1 %cmp2, i32 8, i32 264
  %6 = load i32, ptr %scale, align 4
  %mul = mul nsw i32 %cond4, %6
  store i32 %mul, ptr %t, align 4
  %7 = load i32, ptr %u, align 4
  %and5 = and i32 %7, 1
  %tobool = icmp ne i32 %and5, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end
  %8 = load i32, ptr %scale, align 4
  %mul6 = mul nsw i32 16, %8
  %9 = load i32, ptr %t, align 4
  %add = add nsw i32 %9, %mul6
  store i32 %add, ptr %t, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %cond.end
  %10 = load i32, ptr %u, align 4
  %and7 = and i32 %10, 2
  %tobool8 = icmp ne i32 %and7, 0
  br i1 %tobool8, label %if.then9, label %if.end12

if.then9:                                         ; preds = %if.end
  %11 = load i32, ptr %scale, align 4
  %mul10 = mul nsw i32 32, %11
  %12 = load i32, ptr %t, align 4
  %add11 = add nsw i32 %12, %mul10
  store i32 %add11, ptr %t, align 4
  br label %if.end12

if.end12:                                         ; preds = %if.then9, %if.end
  %13 = load i32, ptr %u, align 4
  %and13 = and i32 %13, 4
  %tobool14 = icmp ne i32 %and13, 0
  br i1 %tobool14, label %if.then15, label %if.end18

if.then15:                                        ; preds = %if.end12
  %14 = load i32, ptr %scale, align 4
  %mul16 = mul nsw i32 64, %14
  %15 = load i32, ptr %t, align 4
  %add17 = add nsw i32 %15, %mul16
  store i32 %add17, ptr %t, align 4
  br label %if.end18

if.end18:                                         ; preds = %if.then15, %if.end12
  %16 = load i32, ptr %u, align 4
  %and19 = and i32 %16, 8
  %tobool20 = icmp ne i32 %and19, 0
  br i1 %tobool20, label %if.then21, label %if.end24

if.then21:                                        ; preds = %if.end18
  %17 = load i32, ptr %scale, align 4
  %mul22 = mul nsw i32 128, %17
  %18 = load i32, ptr %t, align 4
  %add23 = add nsw i32 %18, %mul22
  store i32 %add23, ptr %t, align 4
  br label %if.end24

if.end24:                                         ; preds = %if.then21, %if.end18
  %19 = load i32, ptr %t, align 4
  %20 = load i32, ptr %u, align 4
  %shr25 = ashr i32 %20, 7
  %mul26 = mul nsw i32 2, %shr25
  %sub27 = sub nsw i32 %mul26, 1
  %mul28 = mul nsw i32 %19, %sub27
  ret i32 %mul28
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
