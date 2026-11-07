; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-context-r1/functions/libsodium/variants/c/2_b64_char_to_byte_8.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-context-r1/functions/libsodium/variants/c/2_b64_char_to_byte_8.c"
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
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %d = alloca i32, align 4
  %p = alloca i32, align 4
  %s = alloca i32, align 4
  %x = alloca i32, align 4
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
  %sub2 = sub i32 90, %3
  %or = or i32 %sub1, %sub2
  %shr = lshr i32 %or, 8
  %not = xor i32 %shr, -1
  %and3 = and i32 %and, %not
  store i32 %and3, ptr %a, align 4
  %4 = load i32, ptr %u, align 4
  %sub4 = sub i32 %4, 71
  %and5 = and i32 %sub4, 255
  %5 = load i32, ptr %u, align 4
  %sub6 = sub i32 %5, 97
  %6 = load i32, ptr %u, align 4
  %sub7 = sub i32 122, %6
  %or8 = or i32 %sub6, %sub7
  %shr9 = lshr i32 %or8, 8
  %not10 = xor i32 %shr9, -1
  %and11 = and i32 %and5, %not10
  store i32 %and11, ptr %b, align 4
  %7 = load i32, ptr %u, align 4
  %sub12 = sub i32 %7, -4
  %and13 = and i32 %sub12, 255
  %8 = load i32, ptr %u, align 4
  %sub14 = sub i32 %8, 48
  %9 = load i32, ptr %u, align 4
  %sub15 = sub i32 57, %9
  %or16 = or i32 %sub14, %sub15
  %shr17 = lshr i32 %or16, 8
  %not18 = xor i32 %shr17, -1
  %and19 = and i32 %and13, %not18
  store i32 %and19, ptr %d, align 4
  %10 = load i32, ptr %u, align 4
  %xor = xor i32 %10, 43
  %sub20 = sub i32 0, %xor
  %shr21 = lshr i32 %sub20, 8
  %not22 = xor i32 %shr21, -1
  %and23 = and i32 62, %not22
  store i32 %and23, ptr %p, align 4
  %11 = load i32, ptr %u, align 4
  %xor24 = xor i32 %11, 47
  %sub25 = sub i32 0, %xor24
  %shr26 = lshr i32 %sub25, 8
  %not27 = xor i32 %shr26, -1
  %and28 = and i32 63, %not27
  store i32 %and28, ptr %s, align 4
  %12 = load i32, ptr %a, align 4
  %13 = load i32, ptr %b, align 4
  %or29 = or i32 %12, %13
  %14 = load i32, ptr %d, align 4
  %15 = load i32, ptr %p, align 4
  %16 = load i32, ptr %s, align 4
  %or30 = or i32 %15, %16
  %or31 = or i32 %14, %or30
  %or32 = or i32 %or29, %or31
  store i32 %or32, ptr %x, align 4
  %17 = load i32, ptr %u, align 4
  %xor33 = xor i32 %17, 65
  %sub34 = sub i32 0, %xor33
  %shr35 = lshr i32 %sub34, 8
  %and36 = and i32 %shr35, 255
  %18 = load i32, ptr %x, align 4
  %sub37 = sub i32 0, %18
  %shr38 = lshr i32 %sub37, 8
  %not39 = xor i32 %shr38, -1
  %and40 = and i32 %and36, %not39
  store i32 %and40, ptr %correction, align 4
  %19 = load i32, ptr %x, align 4
  %20 = load i32, ptr %correction, align 4
  %xor41 = xor i32 %19, %20
  %21 = load i32, ptr %x, align 4
  %22 = load i32, ptr %correction, align 4
  %and42 = and i32 %21, %22
  %xor43 = xor i32 %xor41, %and42
  ret i32 %xor43
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
