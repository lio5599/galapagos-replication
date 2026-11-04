; ModuleID = '/home/liolsen/galapagos-replication/functions/libsodium/variants/c/2_b64_char_to_byte_1.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/libsodium/variants/c/2_b64_char_to_byte_1.c"
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
  %x = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  store i32 %0, ptr %u, align 4
  %1 = load i32, ptr %u, align 4
  %sub = sub i32 64, %1
  %shr = lshr i32 %sub, 8
  %and = and i32 %shr, 255
  %2 = load i32, ptr %u, align 4
  %sub1 = sub i32 %2, 91
  %shr2 = lshr i32 %sub1, 8
  %and3 = and i32 %shr2, 255
  %and4 = and i32 %and, %and3
  %3 = load i32, ptr %u, align 4
  %sub5 = sub i32 %3, 65
  %and6 = and i32 %and4, %sub5
  store i32 %and6, ptr %x, align 4
  %4 = load i32, ptr %u, align 4
  %sub7 = sub i32 96, %4
  %shr8 = lshr i32 %sub7, 8
  %and9 = and i32 %shr8, 255
  %5 = load i32, ptr %u, align 4
  %sub10 = sub i32 %5, 123
  %shr11 = lshr i32 %sub10, 8
  %and12 = and i32 %shr11, 255
  %and13 = and i32 %and9, %and12
  %6 = load i32, ptr %u, align 4
  %sub14 = sub i32 %6, 71
  %and15 = and i32 %and13, %sub14
  %7 = load i32, ptr %x, align 4
  %or = or i32 %7, %and15
  store i32 %or, ptr %x, align 4
  %8 = load i32, ptr %u, align 4
  %sub16 = sub i32 47, %8
  %shr17 = lshr i32 %sub16, 8
  %and18 = and i32 %shr17, 255
  %9 = load i32, ptr %u, align 4
  %sub19 = sub i32 %9, 58
  %shr20 = lshr i32 %sub19, 8
  %and21 = and i32 %shr20, 255
  %and22 = and i32 %and18, %and21
  %10 = load i32, ptr %u, align 4
  %add = add i32 %10, 4
  %and23 = and i32 %and22, %add
  %11 = load i32, ptr %x, align 4
  %or24 = or i32 %11, %and23
  store i32 %or24, ptr %x, align 4
  %12 = load i32, ptr %u, align 4
  %xor = xor i32 %12, 43
  %sub25 = sub i32 %xor, 1
  %shr26 = lshr i32 %sub25, 8
  %and27 = and i32 %shr26, 255
  %and28 = and i32 %and27, 62
  %13 = load i32, ptr %x, align 4
  %or29 = or i32 %13, %and28
  store i32 %or29, ptr %x, align 4
  %14 = load i32, ptr %u, align 4
  %xor30 = xor i32 %14, 47
  %sub31 = sub i32 %xor30, 1
  %shr32 = lshr i32 %sub31, 8
  %and33 = and i32 %shr32, 255
  %and34 = and i32 %and33, 63
  %15 = load i32, ptr %x, align 4
  %or35 = or i32 %15, %and34
  store i32 %or35, ptr %x, align 4
  %16 = load i32, ptr %x, align 4
  %17 = load i32, ptr %x, align 4
  %sub36 = sub i32 %17, 1
  %shr37 = lshr i32 %sub36, 8
  %and38 = and i32 %shr37, 255
  %18 = load i32, ptr %u, align 4
  %xor39 = xor i32 %18, 65
  %sub40 = sub i32 0, %xor39
  %shr41 = lshr i32 %sub40, 8
  %and42 = and i32 %shr41, 255
  %and43 = and i32 %and38, %and42
  %or44 = or i32 %16, %and43
  ret i32 %or44
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
