; ModuleID = '/home/liolsen/galapagos-replication/functions/libsodium/variants/c/2_b64_char_to_byte_6.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/libsodium/variants/c/2_b64_char_to_byte_6.c"
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
  %m1 = alloca i32, align 4
  %m2 = alloca i32, align 4
  %x = alloca i32, align 4
  %z = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  store i32 %0, ptr %u, align 4
  %1 = load i32, ptr %u, align 4
  %sub = sub i32 %1, 65
  %shr = lshr i32 %sub, 8
  %not = xor i32 %shr, -1
  %conv = trunc i32 %not to i8
  %conv1 = zext i8 %conv to i32
  store i32 %conv1, ptr %m1, align 4
  %2 = load i32, ptr %u, align 4
  %sub2 = sub i32 90, %2
  %shr3 = lshr i32 %sub2, 8
  %not4 = xor i32 %shr3, -1
  %conv5 = trunc i32 %not4 to i8
  %conv6 = zext i8 %conv5 to i32
  store i32 %conv6, ptr %m2, align 4
  %3 = load i32, ptr %m1, align 4
  %4 = load i32, ptr %m2, align 4
  %and = and i32 %3, %4
  %5 = load i32, ptr %u, align 4
  %sub7 = sub i32 %5, 65
  %and8 = and i32 %and, %sub7
  store i32 %and8, ptr %x, align 4
  %6 = load i32, ptr %u, align 4
  %sub9 = sub i32 %6, 97
  %shr10 = lshr i32 %sub9, 8
  %not11 = xor i32 %shr10, -1
  %conv12 = trunc i32 %not11 to i8
  %conv13 = zext i8 %conv12 to i32
  store i32 %conv13, ptr %m1, align 4
  %7 = load i32, ptr %u, align 4
  %sub14 = sub i32 122, %7
  %shr15 = lshr i32 %sub14, 8
  %not16 = xor i32 %shr15, -1
  %conv17 = trunc i32 %not16 to i8
  %conv18 = zext i8 %conv17 to i32
  store i32 %conv18, ptr %m2, align 4
  %8 = load i32, ptr %m1, align 4
  %9 = load i32, ptr %m2, align 4
  %and19 = and i32 %8, %9
  %10 = load i32, ptr %u, align 4
  %sub20 = sub i32 %10, 71
  %and21 = and i32 %and19, %sub20
  %11 = load i32, ptr %x, align 4
  %or = or i32 %11, %and21
  store i32 %or, ptr %x, align 4
  %12 = load i32, ptr %u, align 4
  %sub22 = sub i32 %12, 48
  %shr23 = lshr i32 %sub22, 8
  %not24 = xor i32 %shr23, -1
  %conv25 = trunc i32 %not24 to i8
  %conv26 = zext i8 %conv25 to i32
  store i32 %conv26, ptr %m1, align 4
  %13 = load i32, ptr %u, align 4
  %sub27 = sub i32 57, %13
  %shr28 = lshr i32 %sub27, 8
  %not29 = xor i32 %shr28, -1
  %conv30 = trunc i32 %not29 to i8
  %conv31 = zext i8 %conv30 to i32
  store i32 %conv31, ptr %m2, align 4
  %14 = load i32, ptr %m1, align 4
  %15 = load i32, ptr %m2, align 4
  %and32 = and i32 %14, %15
  %16 = load i32, ptr %u, align 4
  %add = add i32 %16, 4
  %and33 = and i32 %and32, %add
  %17 = load i32, ptr %x, align 4
  %or34 = or i32 %17, %and33
  store i32 %or34, ptr %x, align 4
  %18 = load i32, ptr %u, align 4
  %xor = xor i32 %18, 43
  %sub35 = sub i32 0, %xor
  %shr36 = lshr i32 %sub35, 8
  %not37 = xor i32 %shr36, -1
  %conv38 = trunc i32 %not37 to i8
  %conv39 = zext i8 %conv38 to i32
  store i32 %conv39, ptr %m1, align 4
  %19 = load i32, ptr %m1, align 4
  %and40 = and i32 %19, 62
  %20 = load i32, ptr %x, align 4
  %or41 = or i32 %20, %and40
  store i32 %or41, ptr %x, align 4
  %21 = load i32, ptr %u, align 4
  %xor42 = xor i32 %21, 47
  %sub43 = sub i32 0, %xor42
  %shr44 = lshr i32 %sub43, 8
  %not45 = xor i32 %shr44, -1
  %conv46 = trunc i32 %not45 to i8
  %conv47 = zext i8 %conv46 to i32
  store i32 %conv47, ptr %m1, align 4
  %22 = load i32, ptr %m1, align 4
  %and48 = and i32 %22, 63
  %23 = load i32, ptr %x, align 4
  %or49 = or i32 %23, %and48
  store i32 %or49, ptr %x, align 4
  %24 = load i32, ptr %x, align 4
  %sub50 = sub i32 0, %24
  %shr51 = lshr i32 %sub50, 8
  %not52 = xor i32 %shr51, -1
  %conv53 = trunc i32 %not52 to i8
  %conv54 = zext i8 %conv53 to i32
  store i32 %conv54, ptr %z, align 4
  %25 = load i32, ptr %u, align 4
  %xor55 = xor i32 %25, 65
  %sub56 = sub i32 0, %xor55
  %shr57 = lshr i32 %sub56, 8
  %conv58 = trunc i32 %shr57 to i8
  %conv59 = zext i8 %conv58 to i32
  store i32 %conv59, ptr %n, align 4
  %26 = load i32, ptr %x, align 4
  %27 = load i32, ptr %z, align 4
  %28 = load i32, ptr %n, align 4
  %and60 = and i32 %27, %28
  %or61 = or i32 %26, %and60
  ret i32 %or61
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
