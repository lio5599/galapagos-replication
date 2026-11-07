; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-cot-r3/functions/libsodium/variants/c/0_b64_byte_to_char_4.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-cot-r3/functions/libsodium/variants/c/0_b64_byte_to_char_4.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @b64_byte_to_char(i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @b64_byte_to_char(i32 noundef %x) #0 {
entry:
  %x.addr = alloca i32, align 4
  %result = alloca i32, align 4
  %i = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  %d = alloca i32, align 4
  %e = alloca i32, align 4
  %bit = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  store i32 0, ptr %result, align 4
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, ptr %i, align 4
  %cmp = icmp ult i32 %0, 8
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32, ptr %x.addr, align 4
  %sub = sub i32 %1, 26
  %2 = load i32, ptr %i, align 4
  %add = add i32 8, %2
  %shr = lshr i32 %sub, %add
  %and = and i32 %shr, 1
  store i32 %and, ptr %a, align 4
  %3 = load i32, ptr %x.addr, align 4
  %sub1 = sub i32 %3, 52
  %4 = load i32, ptr %i, align 4
  %add2 = add i32 8, %4
  %shr3 = lshr i32 %sub1, %add2
  %and4 = and i32 %shr3, 1
  store i32 %and4, ptr %b, align 4
  %5 = load i32, ptr %x.addr, align 4
  %sub5 = sub i32 %5, 62
  %6 = load i32, ptr %i, align 4
  %add6 = add i32 8, %6
  %shr7 = lshr i32 %sub5, %add6
  %and8 = and i32 %shr7, 1
  store i32 %and8, ptr %c, align 4
  %7 = load i32, ptr %x.addr, align 4
  %xor = xor i32 %7, 62
  %sub9 = sub i32 0, %xor
  %8 = load i32, ptr %i, align 4
  %add10 = add i32 8, %8
  %shr11 = lshr i32 %sub9, %add10
  %and12 = and i32 %shr11, 1
  %xor13 = xor i32 %and12, 1
  store i32 %xor13, ptr %d, align 4
  %9 = load i32, ptr %x.addr, align 4
  %xor14 = xor i32 %9, 63
  %sub15 = sub i32 0, %xor14
  %10 = load i32, ptr %i, align 4
  %add16 = add i32 8, %10
  %shr17 = lshr i32 %sub15, %add16
  %and18 = and i32 %shr17, 1
  %xor19 = xor i32 %and18, 1
  store i32 %xor19, ptr %e, align 4
  %11 = load i32, ptr %a, align 4
  %12 = load i32, ptr %x.addr, align 4
  %add20 = add i32 %12, 65
  %13 = load i32, ptr %i, align 4
  %shr21 = lshr i32 %add20, %13
  %and22 = and i32 %11, %shr21
  %14 = load i32, ptr %a, align 4
  %xor23 = xor i32 %14, 1
  %15 = load i32, ptr %b, align 4
  %and24 = and i32 %xor23, %15
  %16 = load i32, ptr %x.addr, align 4
  %add25 = add i32 %16, 71
  %17 = load i32, ptr %i, align 4
  %shr26 = lshr i32 %add25, %17
  %and27 = and i32 %and24, %shr26
  %or = or i32 %and22, %and27
  %18 = load i32, ptr %b, align 4
  %xor28 = xor i32 %18, 1
  %19 = load i32, ptr %c, align 4
  %and29 = and i32 %xor28, %19
  %20 = load i32, ptr %x.addr, align 4
  %add30 = add i32 %20, -4
  %21 = load i32, ptr %i, align 4
  %shr31 = lshr i32 %add30, %21
  %and32 = and i32 %and29, %shr31
  %or33 = or i32 %or, %and32
  %22 = load i32, ptr %d, align 4
  %23 = load i32, ptr %i, align 4
  %shr34 = lshr i32 43, %23
  %and35 = and i32 %22, %shr34
  %or36 = or i32 %or33, %and35
  %24 = load i32, ptr %e, align 4
  %25 = load i32, ptr %i, align 4
  %shr37 = lshr i32 47, %25
  %and38 = and i32 %24, %shr37
  %or39 = or i32 %or36, %and38
  store i32 %or39, ptr %bit, align 4
  %26 = load i32, ptr %bit, align 4
  %27 = load i32, ptr %i, align 4
  %shl = shl i32 %26, %27
  %28 = load i32, ptr %result, align 4
  %or40 = or i32 %28, %shl
  store i32 %or40, ptr %result, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %29 = load i32, ptr %i, align 4
  %inc = add i32 %29, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %30 = load i32, ptr %result, align 4
  ret i32 %30
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
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
