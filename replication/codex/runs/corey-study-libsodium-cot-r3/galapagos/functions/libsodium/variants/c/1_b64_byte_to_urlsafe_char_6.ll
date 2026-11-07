; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-cot-r3/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_6.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-cot-r3/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_6.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @b64_byte_to_urlsafe_char(i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @b64_byte_to_urlsafe_char(i32 noundef %x) #0 {
entry:
  %x.addr = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %result = alloca i32, align 4
  %term = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4
  %sub = sub i32 %0, 26
  %shr = lshr i32 %sub, 8
  %and = and i32 %shr, 255
  store i32 %and, ptr %a, align 4
  %1 = load i32, ptr %x.addr, align 4
  %sub1 = sub i32 %1, 52
  %shr2 = lshr i32 %sub1, 8
  %and3 = and i32 %shr2, 255
  store i32 %and3, ptr %b, align 4
  %2 = load i32, ptr %a, align 4
  %3 = load i32, ptr %x.addr, align 4
  %add = add i32 %3, 65
  %and4 = and i32 %2, %add
  store i32 %and4, ptr %result, align 4
  %4 = load i32, ptr %a, align 4
  %xor = xor i32 255, %4
  %5 = load i32, ptr %b, align 4
  %and5 = and i32 %xor, %5
  %6 = load i32, ptr %x.addr, align 4
  %add6 = add i32 %6, 71
  %and7 = and i32 %and5, %add6
  store i32 %and7, ptr %term, align 4
  %7 = load i32, ptr %result, align 4
  %8 = load i32, ptr %term, align 4
  %add8 = add i32 %7, %8
  %9 = load i32, ptr %result, align 4
  %10 = load i32, ptr %term, align 4
  %and9 = and i32 %9, %10
  %sub10 = sub i32 %add8, %and9
  store i32 %sub10, ptr %result, align 4
  %11 = load i32, ptr %b, align 4
  %xor11 = xor i32 255, %11
  %12 = load i32, ptr %x.addr, align 4
  %sub12 = sub i32 %12, 62
  %shr13 = lshr i32 %sub12, 8
  %and14 = and i32 %shr13, 255
  %and15 = and i32 %xor11, %and14
  %13 = load i32, ptr %x.addr, align 4
  %add16 = add i32 %13, -4
  %and17 = and i32 %and15, %add16
  store i32 %and17, ptr %term, align 4
  %14 = load i32, ptr %result, align 4
  %15 = load i32, ptr %term, align 4
  %add18 = add i32 %14, %15
  %16 = load i32, ptr %result, align 4
  %17 = load i32, ptr %term, align 4
  %and19 = and i32 %16, %17
  %sub20 = sub i32 %add18, %and19
  store i32 %sub20, ptr %result, align 4
  %18 = load i32, ptr %x.addr, align 4
  %xor21 = xor i32 %18, 62
  %sub22 = sub i32 0, %xor21
  %shr23 = lshr i32 %sub22, 8
  %and24 = and i32 %shr23, 255
  %xor25 = xor i32 255, %and24
  %and26 = and i32 %xor25, 45
  store i32 %and26, ptr %term, align 4
  %19 = load i32, ptr %result, align 4
  %20 = load i32, ptr %term, align 4
  %add27 = add i32 %19, %20
  %21 = load i32, ptr %result, align 4
  %22 = load i32, ptr %term, align 4
  %and28 = and i32 %21, %22
  %sub29 = sub i32 %add27, %and28
  store i32 %sub29, ptr %result, align 4
  %23 = load i32, ptr %x.addr, align 4
  %xor30 = xor i32 %23, 63
  %sub31 = sub i32 0, %xor30
  %shr32 = lshr i32 %sub31, 8
  %and33 = and i32 %shr32, 255
  %xor34 = xor i32 255, %and33
  %and35 = and i32 %xor34, 95
  store i32 %and35, ptr %term, align 4
  %24 = load i32, ptr %result, align 4
  %25 = load i32, ptr %term, align 4
  %add36 = add i32 %24, %25
  %26 = load i32, ptr %result, align 4
  %27 = load i32, ptr %term, align 4
  %and37 = and i32 %26, %27
  %sub38 = sub i32 %add36, %and37
  store i32 %sub38, ptr %result, align 4
  %28 = load i32, ptr %result, align 4
  ret i32 %28
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
