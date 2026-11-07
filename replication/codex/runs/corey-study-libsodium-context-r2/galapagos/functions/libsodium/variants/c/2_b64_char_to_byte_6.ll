; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-context-r2/functions/libsodium/variants/c/2_b64_char_to_byte_6.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-context-r2/functions/libsodium/variants/c/2_b64_char_to_byte_6.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @b64_char_to_byte(i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @b64_char_to_byte(i32 noundef %c) #0 {
entry:
  %c.addr = alloca i32, align 4
  %u = alloca i32, align 4
  %upper = alloca i32, align 4
  %lower = alloca i32, align 4
  %digit = alloca i32, align 4
  %plus = alloca i32, align 4
  %slash = alloca i32, align 4
  %x = alloca i32, align 4
  %not_a = alloca i32, align 4
  %correction = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  store i32 %0, ptr %u, align 4
  %1 = load i32, ptr %u, align 4
  %sub = sub i32 %1, 65
  %and = and i32 %sub, 255
  %2 = load i32, ptr %u, align 4
  %sub1 = sub i32 %2, 65
  %3 = load i32, ptr %u, align 4
  %sub2 = sub i32 %3, 65
  %4 = load i32, ptr %u, align 4
  %sub3 = sub i32 90, %4
  %or = or i32 %sub2, %sub3
  %shr = lshr i32 %or, 8
  %and4 = and i32 %sub1, %shr
  %and5 = and i32 %and4, 255
  %xor = xor i32 %and, %and5
  store i32 %xor, ptr %upper, align 4
  %5 = load i32, ptr %u, align 4
  %sub6 = sub i32 %5, 71
  %and7 = and i32 %sub6, 255
  %6 = load i32, ptr %u, align 4
  %sub8 = sub i32 %6, 71
  %7 = load i32, ptr %u, align 4
  %sub9 = sub i32 %7, 97
  %8 = load i32, ptr %u, align 4
  %sub10 = sub i32 122, %8
  %or11 = or i32 %sub9, %sub10
  %shr12 = lshr i32 %or11, 8
  %and13 = and i32 %sub8, %shr12
  %and14 = and i32 %and13, 255
  %xor15 = xor i32 %and7, %and14
  store i32 %xor15, ptr %lower, align 4
  %9 = load i32, ptr %u, align 4
  %sub16 = sub i32 %9, -4
  %and17 = and i32 %sub16, 255
  %10 = load i32, ptr %u, align 4
  %sub18 = sub i32 %10, -4
  %11 = load i32, ptr %u, align 4
  %sub19 = sub i32 %11, 48
  %12 = load i32, ptr %u, align 4
  %sub20 = sub i32 57, %12
  %or21 = or i32 %sub19, %sub20
  %shr22 = lshr i32 %or21, 8
  %and23 = and i32 %sub18, %shr22
  %and24 = and i32 %and23, 255
  %xor25 = xor i32 %and17, %and24
  store i32 %xor25, ptr %digit, align 4
  %13 = load i32, ptr %u, align 4
  %xor26 = xor i32 %13, 43
  %sub27 = sub i32 0, %xor26
  %shr28 = lshr i32 %sub27, 8
  %and29 = and i32 62, %shr28
  %xor30 = xor i32 62, %and29
  store i32 %xor30, ptr %plus, align 4
  %14 = load i32, ptr %u, align 4
  %xor31 = xor i32 %14, 47
  %sub32 = sub i32 0, %xor31
  %shr33 = lshr i32 %sub32, 8
  %and34 = and i32 63, %shr33
  %xor35 = xor i32 63, %and34
  store i32 %xor35, ptr %slash, align 4
  %15 = load i32, ptr %upper, align 4
  %16 = load i32, ptr %lower, align 4
  %or36 = or i32 %15, %16
  %17 = load i32, ptr %digit, align 4
  %or37 = or i32 %or36, %17
  %18 = load i32, ptr %plus, align 4
  %or38 = or i32 %or37, %18
  %19 = load i32, ptr %slash, align 4
  %or39 = or i32 %or38, %19
  store i32 %or39, ptr %x, align 4
  %20 = load i32, ptr %u, align 4
  %xor40 = xor i32 %20, 65
  %sub41 = sub i32 0, %xor40
  %shr42 = lshr i32 %sub41, 8
  %and43 = and i32 %shr42, 255
  store i32 %and43, ptr %not_a, align 4
  %21 = load i32, ptr %not_a, align 4
  %22 = load i32, ptr %not_a, align 4
  %23 = load i32, ptr %x, align 4
  %sub44 = sub i32 0, %23
  %shr45 = lshr i32 %sub44, 8
  %and46 = and i32 %22, %shr45
  %xor47 = xor i32 %21, %and46
  store i32 %xor47, ptr %correction, align 4
  %24 = load i32, ptr %x, align 4
  %25 = load i32, ptr %correction, align 4
  %or48 = or i32 %24, %25
  ret i32 %or48
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
